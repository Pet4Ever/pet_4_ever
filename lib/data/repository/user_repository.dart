import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_4_ever/data/model/user_model.dart';

class UserRepository {
  // uid로 user 정보 가져오기
  Future<UserModel> getByUid(String userId) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('user');
    final query = collectionRef.doc(userId);
    final result = await query.get();

    if (result.exists) {
      final map = {
        'id': result.id, // 문서 ID
        ...result.data()!, // 문서 데이터 (null이 아님을 보장)
      };
      return UserModel.fromJson(map); // UserModel 객체 반환
    } else {
      // throw Exception('No user found with uid: $userId'); // 결과가 없을 때 예외 처리
      return UserModel(id: 'id', email: 'email', name: 'name', address: '');
    }
  }
}
