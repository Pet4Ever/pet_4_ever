import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  // 회원가입
  //
  Future<User?> join(String email, String password, String name) async {
    try {
      print('회원가입 시도: $email, $name');
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 새로만든 사용자 정보
      final user = userCredential.user;

      if (user != null) {
        print('회원가입 성공, Firestore 저장 시작');
        // FireStore에 회원가입한 사용자 정보 저장
        final colRef = FirebaseFirestore.instance.collection('user');
        final docRef = colRef.doc(user.uid); // uid(유저고유값)으로 문서 생성

        await docRef.set({
          'name': name,
          'email': user.email,
          // 'uid': user.uid,
        });
      }
    } on FirebaseAuthException catch (e) {
      // 예외처리(Firebase)
      if (e.code == 'email-already-in-use') {
        throw Exception('이미 사용중인 이메일입니다');
      } else if (e.code == 'invalid-email') {
        throw Exception('유효하지 않은 이메일 형식입니다');
      } else if (e.code == 'weak-password') {
        throw Exception('비밀번호를 다시 입력해주세요');
      }
    } catch (e) {
      throw Exception('회원가입 중 알 수 없는 오류가 발생했습니다: ${e.toString()}');
    }
    return null;
  }

  // 로그인
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      print(e.code);
      switch (e.code) {
        case 'user-not-found':
          errorMessage = '해당 이메일로 가입된 계정이 없습니다';
          break;
        case 'wrong-password':
          errorMessage = '비밀번호가 잘못되었습니다';
          break;
        case 'invalid-email':
          errorMessage = '유효하지 않은 이메일 형식입니다';
          break;
        default:
          errorMessage = '로그인 중 문제 발생! ${e.message}';
          break;
      }
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('알 수 없는 오류가 발생했습니다: ${e.toString()}');
    }
  }

  // 로그인 후, FireStore에서 사용자 정보 가져오기
  Future<Map<String, dynamic>?> userData(String uid) async {
    try {
      // uid 고유번호로 사용자 정보 가져옴
      final fromUid =
          await FirebaseFirestore.instance.collection('user').doc(uid).get();
      if (fromUid.exists) {
        return fromUid.data();
      } else {
        throw Exception('사용자 정보를 찾을 수 없습니다');
      }
    } catch (e) {
      print(e);
      throw Exception('사용자 정보를 불러오는 중 문제가 발생했습니다: ${e.toString()}');
    }
  }
}
