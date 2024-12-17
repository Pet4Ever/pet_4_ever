import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/user_data.dart';

String userId = "샘플유저아이디";

class ChatRepository {
  ChatRepository();

  Stream<List<Chat>> chatListStream() {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('chat');
    final stream = collectionRef.snapshots();

    return stream.map((event) {
      return event.docs.map((doc) {
        return Chat.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    });
  }

  static Future<Chat?> findChat(String pet_id) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('chat');
    final query = collectionRef
        .where('pet_id', isEqualTo: pet_id);
        // .where('users', arrayContains: currentUser!.id);

    final result = await query.get();
    final docs = result.docs;

    if (docs.length > 0) {
      return docs.map((doc) {
        return Chat.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList().first;
    } else {
      
    }
  }

  // CREATE
  Future<bool> createChat({
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

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // DELETE
}
