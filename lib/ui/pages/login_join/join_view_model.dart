import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/user.dart';
import 'package:pet_4_ever/data/repository/user_repository.dart';

// 1. 상태 클래스 만들기

// 2. 뷰모델 만들기
class JoinViewModel extends AutoDisposeNotifier<User?> {
  // 여기서 User 레포지토리 호출
  JoinViewModel(this.userRepository);
  final UserRepository userRepository;

  @override
  User? build() {
    return null;
  }

  // 회원가입
  Future<bool> join({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // 회원가입 요청
      final user = await userRepository.join(
        name: name,
        email: email,
        password: password,
      );
      state = user;
      return true;
    } catch (e) {
      print('회원가입 실패');
      return false;
    }
  }
}

// 3. 뷰모델 관리자 만들기
final joinViewModelProvider = AutoDisposeNotifierProvider<JoinViewModel, User?>(
  () => JoinViewModel,
);
