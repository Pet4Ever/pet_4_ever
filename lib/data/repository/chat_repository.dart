import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/data/model/pet.dart';
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

        // 최근메세지 조회
        final messageRef = doc.reference
            .collection('messages')
            .orderBy('createdAt', descending: true)
            .limit(1);
        final messageSnapshot = await messageRef.get();

        if (messageSnapshot.docs.isNotEmpty) {
          chat.recentMessage = Message.fromJson({
            'id': messageSnapshot.docs.first.id,
            ...messageSnapshot.docs.first.data(),
          });
        }

        // pet 정보 조회
        final petRef = firestore.collection('pet').doc(chat.pet_id);
        final petSnapshot = await petRef.get();
        if (petSnapshot.exists) {
          chat.pet = Pet.fromJson({
            'id': petSnapshot.id,
            ...?petSnapshot.data(),
          });
        }
        print("PET!! ${chat.pet}");

        return chat;
      }).toList());

      print("chatList.length == ${chatList.length}");
      return chatList;
    });
  }

  Future<Chat?> findChat(String pet_id) async {
    final currentUser = UserData().currentUser;

    if (currentUser == null) {
      throw Exception('User is not logged in');
    }

    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('chat');
    final query = collectionRef
        .where('pet_id', isEqualTo: pet_id)
        .where('users', arrayContains: currentUser.uid)
        .limit(1); // limit(1)을 추가하여 첫 번째 항목만 조회

    final result = await query.get();
    final docs = result.docs;

    if (docs.isNotEmpty) {
      final doc = docs.first;
      
      final chat = Chat.fromJson({
        'id': doc.id,
        ...doc.data(),
      });

      // pet 정보 조회
      final petRef = firestore.collection('pet').doc(pet_id);
      final petSnapshot = await petRef.get();
      if (petSnapshot.exists) {
        chat.pet = Pet.fromJson({
          'id': petSnapshot.id,
          ...?petSnapshot.data(),
        });
      }
      return chat;
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
        final chat = Chat.fromJson({
          'id': docRef.id,
          ...data!,
        });
        // pet 정보 조회
        final petRef = firestore.collection('pet').doc(pet_id);
        final petSnapshot = await petRef.get();
        if (petSnapshot.exists) {
          chat.pet = Pet.fromJson({
            'id': petSnapshot.id,
            ...?petSnapshot.data(),
          });
        }
        return chat;
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // DELETE
}
