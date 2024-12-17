import 'package:firebase_auth/firebase_auth.dart';


class UserData {
  static final UserData _instance = UserData._internal();
  factory UserData() => _instance;

  User? currentUser;

  UserData._internal();

}

