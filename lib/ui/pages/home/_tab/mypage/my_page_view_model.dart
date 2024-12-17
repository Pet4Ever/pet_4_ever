//상태 만들기
//뷰모델 만들기
//뷰모델 관리자 만들기

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/repository/my_page_repository.dart';
import 'package:pet_4_ever/user_data.dart';

class MyPageViewModel extends Notifier<List<Pet>> {
  @override
  List<Pet> build() {
    getDogList();
    return [];
  }

  final mypageRepository = MyPageRepository();

  //사용자 정보로 반려견 데이터 가져오기
  // Future<void> getPetData(String userId) async {
  //   state = await mypageRepository.getById(userId);
  // }

  //반려견 상태 활성화 버튼
  // void toggleOnoff(String name) {
  //   state = state.map(
  //     (pet) {
  //       if (pet.name == name) {
  //         return pet.copyWith(visibility: !(pet.visibility ?? false));
  //       }
  //       return pet;
  //     },
  //   ).toList();
  // }
  
  void toggleOnoff(String name) {
  // 상태의 리스트를 직접 변경
  for (var pet in state) {
    if (pet.name == name) {
      // currentState 값을 반전시켜 객체를 업데이트
      pet.visibility = !(pet.visibility ?? false);
    }
  }
  // 리스트의 변경 사항을 알리기 위해 동일한 객체를 다시 할당
  state = [...state];
}
  Future<void> getDogList() async {
    User? currentUser = UserData().currentUser;
    final myRepo = MyPageRepository();
    final stream = myRepo.getPetStreamById(currentUser!.uid);
    final streamSubscription = stream.listen((pet) {
      state = pet;
    });
    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }


}

final myPageViewModel = NotifierProvider<MyPageViewModel, List<Pet>>(
  () => MyPageViewModel(),
);
