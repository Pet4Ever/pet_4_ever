import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_4_ever/data/model/user_model.dart';


class UserData {
  static final UserData _instance = UserData._internal();
  factory UserData() => _instance;

  User? currentUser;

  UserData._internal();

}

