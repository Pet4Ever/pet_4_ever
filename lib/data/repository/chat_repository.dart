import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/user_data.dart';

class ChatRepository {
  ChatRepository();

  Stream<List<Chat>> chatListStream() {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('chat');
    final stream = collectionRef
        .where('users', arrayContains: UserData().currentUser!.uid)
        .snapshots();

    return stream.asyncMap((event) async {
      final chatList = await Future.wait(event.docs.map((doc) async {
        final chat = Chat.fromJson({
          'id': doc.id,
          ...doc.data(),
        });

        final messageRef = doc.reference
            .collection('message')
            .orderBy('createdAt', descending: true)
            .limit(1);
        final messageSnapshot = await messageRef.get();

        if (messageSnapshot.docs.isNotEmpty) {
          final recentMessage = messageSnapshot.docs.first.data();
          chat.recentMessage = Message.fromJson({
            'id': messageSnapshot.docs.first.id,
            ...recentMessage,
          });
        }
        return chat;
      }).toList());

      return chatList;
    });
  }

  Future<Chat?> findChat(String pet_id) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('chat');
    final query = collectionRef
        .where('pet_id', isEqualTo: pet_id)
        // .where('users', arrayContains: user_id);
        .where('users', arrayContains: UserData().currentUser!.uid);

    final result = await query.get();
    final docs = result.docs;

    if (docs.length > 0) {
      return docs
          .map((doc) {
            return Chat.fromJson({
              'id': doc.id,
              ...doc.data(),
            });
          })
          .toList()
          .first;
    } else {
      return null;
    }
  }

  // CREATE
  Future<Chat?> createAndReturnChat({
    required String pet_id,
    required List<String> users,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef = firestore.collection('chat');
      final docRef = collectionRef.doc();

      await docRef.set({
        'pet_id': pet_id,
        'users': users,
      });

      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        return Chat.fromJson({
          'id': docRef.id,
          ...data!,
        });
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // DELETE
}
