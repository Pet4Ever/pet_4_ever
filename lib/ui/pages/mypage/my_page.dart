import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/dog_grid_view_box.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/user_profile_box.dart';

class Mypage extends StatelessWidget {

  //사용자가 등록한 강아지 프로필 수(임시 데이터)
  int sampleCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('우리집'),
      ),
      body: Column(
        children: [
          //사용자 프로필
          UserProfileBox(),
          //반려견 프로필 보여주는 그리드뷰 영역
          DogGridViewBox(sampleCount),
        ],
      ),
    );
  }
}
