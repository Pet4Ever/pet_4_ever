import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/repository/friends_repository.dart';

/*
- Firebase 데이터와 UI를 연결
- 상태 관리 및 데이터 변경시 UI 업데이트
- UI 이벤트 처리 
*/

// 상태 클래스 만들기  List<Pet>

// 뷰모델 만들기

class FriendViewModel extends Notifier<List<Pet>> {
  @override
  List<Pet> build() {
    _initialize();
    return [];
  }

  Future<void> _initialize() async {
    await getAllPets();
  }

  Future<void> getAllPets() async {
    final friendRepo = FriendsRepository();
    final friends = await friendRepo.getAll();
    state = friends ?? [];
  }
}

// 뷰모델 관리자 만들기
final friendViewModelProvider =
    NotifierProvider<FriendViewModel, List<Pet>>(() {
  return FriendViewModel();
});
