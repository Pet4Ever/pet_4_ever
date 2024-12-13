//상태 만들기
//뷰모델 만들기
//뷰모델 관리자 만들기

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/repository/my_page_repository.dart';

class MyPageViewModel extends AutoDisposeNotifier<List<Pet>>{
  @override
  List<Pet> build() {
    return [];
  }

  final mypageRepository = MyPageRepository();

  //사용자 정보로 반려견 데이터 가져오기
  Future<void> getPetData(String userId) async {
    state = await mypageRepository.getById(userId);
  }

  //반려견 상태 활성화 버튼
  void toggleOnoff(String name){
    state = state.map((pet) {
      if(pet.name == name){
        return pet.copyWith(currentState: !(pet.currentState ?? false));
      }
      return pet;
      
    },).toList();
  }

  void toggleSwitch(String name){

  }

}