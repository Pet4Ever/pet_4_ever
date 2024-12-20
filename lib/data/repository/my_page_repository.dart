//아이디로 펫 정보 불러오기
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/pet.dart';

class MyPageRepository {
  //user id로 펫 정보 가져오기
  Future<List<Pet>> getById(String userId) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('pet');

    //유저 아이디로 펫 정보 가져오기
    final query = collectionRef.where('owner_id', isEqualTo: userId);
    final result = await query.get();

    //테스트를 위해 전체 펫 정보 가져옴
    // final result = await collectionRef.get();
    final docs = result.docs;

    final iterable = docs.map((e) {
      final map = {
        'id': e.id,
        ...e.data(),
      };
      return Pet.fromJson(map);
    });

    final petList = iterable.toList();
    return petList;
  }

  //스트림으로 관리하기
  Stream<List<Pet>> getPetStreamById(String userId) {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('pet');
    final query = collectionRef.where('owner_id', isEqualTo: userId);
    return query.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final map = {
          'id': doc.id,
          ...doc.data(),
        };
        return Pet.fromJson(map);
      }).toList();
    });
  }
}
