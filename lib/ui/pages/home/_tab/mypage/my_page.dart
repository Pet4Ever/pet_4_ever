import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/my_page_view_model.dart';
import 'package:pet_4_ever/ui/pages/home/home_view_model.dart';
import 'package:pet_4_ever/user_data.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/widgets/dog_grid_view_box.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/widgets/user_profile_box.dart';

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.watch(homeViewModel);
      User? currentUser = UserData().currentUser;
      if (currentUser != null) {
        print("UID: ${currentUser.uid}");
        print("Email: ${currentUser.email}");
      }
      // 사용자 UID가 비어 있지 않을 경우
      if (currentUser!.uid.isNotEmpty == true) {
        // UID가 있다면 데이터를 가져오기
        ref.read(myPageViewModel.notifier).getDogList();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '우리집',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Cafe24Ssurround-v2.0',
                letterSpacing: 1,
              ),
            ),
          ),
          body: Column(
            children: [
              // 사용자 프로필
              UserProfileBox(),
              // 반려견 프로필 보여주는 그리드뷰 영역
              DogGridViewBox(),
            ],
          ),
        );
      } else {
        // UID가 비어 있을 경우 로그인 메시지 반환
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '우리집',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Cafe24Ssurround-v2.0',
                letterSpacing: 1,
              ),
            ),
          ),
          body: Center(
            child: Text(
              '로그인이 필요합니다',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    });
  }
}
