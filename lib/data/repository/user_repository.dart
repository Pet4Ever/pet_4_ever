
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/user_model.dart';

class UserRepository {
  // uid로 user 정보 가져오기
  Future<UserModel> getByUid(String userId) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('user');

    final query = collectionRef.where('uid', isEqualTo: userId);
    final result = await query.get();

    // 결과에서 첫 번째 문서 가져오기
    if (result.docs.isNotEmpty) {
      final doc = result.docs.first; // 첫 번째 문서 선택
      final map = {
        'id': doc.id,
        ...doc.data(),
      };
      return UserModel.fromJson(map); // UserModel 객체 반환
    } else {
      throw Exception('No user found with uid: $userId'); // 결과가 없을 때 예외 처리
    }
  }
}

