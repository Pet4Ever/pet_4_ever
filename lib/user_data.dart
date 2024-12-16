import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_4_ever/data/model/user_model.dart';

//user의 uid 저장해둘 전역 리스트
List<User?> userData = [];

// 로그인 된 사용자 정보(예시)
UserModel? loginedUser;
// id<필수