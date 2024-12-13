import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/message.dart';

class MessageRepository {
  MessageRepository();

  Stream<List<Message>> MessageListStream(String chat_id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final collectionRef = firestore
        .collection('chat')
        .doc(chat_id)
        .collection('messages')
        .orderBy('createdAt');

    final stream = collectionRef.snapshots();

    return stream.map((event) {
      return event.docs.map((doc) {
        return Message.fromJson({
          'id': doc.id,
          ...doc.data(),
        });
      }).toList();
    });
  }

  Future<bool> sendMessage({
    required String chat_id,
    required String sender_id,
    required String message,
  }) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final collectionRef =
          firestore.collection('chat').doc(chat_id).collection('messages');
      final docRef = collectionRef.doc();

      await docRef.set({
        'sender_id': sender_id,
        'message': message,
        'createdAt': DateTime.now().toIso8601String()
      });

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
