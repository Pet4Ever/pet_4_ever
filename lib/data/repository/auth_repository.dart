import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  // 회원가입
  // 
  Future<User?> join(String email, String password, String name) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 새로만든 사용자 정보
      final user = userCredential.user;

      if (user != null) {
        // FireStore에 회원가입한 사용자 정보 저장
        final colRef = FirebaseFirestore.instance.collection('user');
        final docRef = colRef.doc(user.uid); // uid(유저고유값)으로 문서 생성

        await docRef.set({
          'name': name,
          'email': user.email,
          'uid': user.uid,
        });
      }
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 로그인
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 로그인 후, FireStore에서 사용자 정보 가져오기
  Future<Map<String, dynamic>?> userData(String uid) async {
    try {
      // uid 고유번호로 사용자 정보 가져옴
      final fromUid = await FirebaseFirestore.instance.collection('user').doc(uid).get();
      if (fromUid.exists) {
        return fromUid.data();
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
