//상태 만들기
//뷰모델 만들기
//뷰모델 관리자 만들기

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/user_model.dart';
import 'package:pet_4_ever/data/repository/user_repository.dart';

class UserDataViewModel extends Notifier<UserModel> {
  final userRepository = UserRepository();

  @override
  UserModel build() {
    return UserModel(id: '', email: '', name: '', address: '');
  }

  //사용자 데이터 가져오기
  Future<void> getUserData(String userId) async {
    try {
      final userData = await userRepository.getByUid(userId);
      state = userData;
    } catch (e) {
      print('사용자 데이터 불러오기 실패: $e');
    }
  }
}

final userDataViewModel = NotifierProvider<UserDataViewModel, UserModel>(
  () => UserDataViewModel(),
);
