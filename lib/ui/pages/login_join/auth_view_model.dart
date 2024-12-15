import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/repository/auth_repository.dart';

// 1. 상태클래스

// 2. 뷰모델
// 회원가입, 로그인 
class AuthViewModel extends StateNotifier<User?> {
  final AuthRepository authRepository;

  AuthViewModel(this.authRepository) : super(null);

  // 회원가입
  Future<void> join(String email, String password, String name) async {
    final user = await authRepository.join(email, password, name);
    state = user; 
  }

  // 로그인
  Future<void> login(String email, String password) async {
    final user = await authRepository.login(email, password);
    state = user;
  }
}

// 3. 뷰모델 관리자
final authViewModelProvider = StateNotifierProvider<AuthViewModel, void> (
  (ref) => AuthViewModel(FirebaseAuth.instance as AuthRepository),
);