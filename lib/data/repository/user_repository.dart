import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/user.dart';

class UserRepository {
  final userCollection = FirebaseFirestore.instance.collection('user');

  Future<List<User>> getUsers() async {
    final querySnapshot = await userCollection.get();

    return querySnapshot.docs.map((doc) {
      return User.fromJson({
        'id': doc.id,
        ...doc.data() as Map<String, dynamic>,
      });
    }).toList();
  }
}
