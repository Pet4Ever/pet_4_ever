import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/chat.dart';

String userId = "샘플유저아이디";

class ChatRepository {
  ChatRepository();

  // Future<List<Chat>?> getChatList() async {
  //   try {
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     final collectionRef = firestore.collection('chat');
  //     // .where("users", arrayContains: userId);
  //     final result = await collectionRef.get();
  //     final docs = result.docs;

  //     return docs.map((doc) {
  //       final map = {
  //         'id': doc.id,
  //         ...doc.data(),
  //       };
  //       return Chat.fromJson(map);
  //     }).toList();
  //   } catch (e) {
  //     print("e :: $e");
  //     return null;
  //   }
  // }
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