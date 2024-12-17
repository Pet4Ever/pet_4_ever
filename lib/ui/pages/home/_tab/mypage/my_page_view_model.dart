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

  // 반려견 visibility 변경 버튼
  Future<void> updateVisibility(String petName, bool visibility) async {
    try {
      final firestore = FirebaseFirestore.instance;
      // 검색 필드와 값으로 문서 쿼리
      final querySnapshot = await firestore
          .collection('pet')
          .where('name', isEqualTo: petName)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // 찾은 문서가 하나 이상 있을 경우, 첫 번째 문서 업데이트
        final documentId = querySnapshot.docs.first.id;
        await firestore.collection('pet').doc(documentId).update({
          'visibility': !visibility,
        });
        print('Document updated successfully');
      } else {
        print('No documents found for the given search criteria.');
      }
    } catch (e) {
      print('Error updating document: $e');
    }
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
