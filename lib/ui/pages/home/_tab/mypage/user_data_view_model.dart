//상태 만들기
//뷰모델 만들기
//뷰모델 관리자 만들기

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/user_model.dart';
import 'package:pet_4_ever/data/repository/user_repository.dart';

class UserDataViewModel extends Notifier<UserModel> {


  final userRepository = UserRepository();

  //사용자 데이터 가져오기
  Future<void> getUserData(String userId) async {
    state = await userRepository.getByUid(userId);
  }
  
  @override
  UserModel build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}

final userDataViewModel = NotifierProvider<UserDataViewModel, UserModel>(
  () => UserDataViewModel(),
);
