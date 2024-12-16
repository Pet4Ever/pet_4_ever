import 'package:firebase_auth/firebase_auth.dart';

// user.dart 모델이랑 auth의 user이랑 겹치는 부분이 에러가 나는거 같아서 userModel.dart로 바꿔줌

class UserModel {
  String uid;
  String email;
  String name;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
  });

  // Firebase User 객체를 UserModel로 바꿔줌
  // Firebase에서 제공하는 User 객체의 속성(uid, email, displayName, photoURL, emailVerified)
  factory UserModel.fromFirebase(User firebaseUser) {
    return UserModel(
      uid: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}