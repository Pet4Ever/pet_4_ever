import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/repository/friends_repository.dart';
import 'package:pet_4_ever/data/repository/user_repository.dart';

/*
- Firebase 데이터와 UI를 연결
- 상태 관리 및 데이터 변경시 UI 업데이트
- UI 이벤트 처리 
*/

// 상태 클래스 만들기  List<Pet>

// 뷰모델 만들기

class FriendViewModel extends Notifier<List<Pet>> {
  final FriendsRepository _friendRepo;
  FriendViewModel(this._friendRepo);

  @override
  List<Pet> build() {
    //_initialize();
    return [];
  }

  // Future<void> _initialize() async {
  //   await getAllPets();
  // }

  Future<void> getAllPets(String userAddress) async {
    final friends = await _friendRepo.getFilteredPetsByAddress(userAddress);
    state = friends ?? [];
  }
}

// 뷰모델 관리자 만들기
final friendViewModelProvider =
    NotifierProvider<FriendViewModel, List<Pet>>(() {
  //final friendRepo = FriendsRepository();
  return FriendViewModel(FriendsRepository());
});
