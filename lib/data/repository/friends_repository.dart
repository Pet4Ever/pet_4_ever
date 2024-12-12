import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FriendsRepository {
  Future<void> getAll() async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('pet');
    final result = await collectionRef.get();
    final docs = result.docs;
    for (var doc in docs) {
      print(doc.id);
      print(doc.data());
    }
  }
}
