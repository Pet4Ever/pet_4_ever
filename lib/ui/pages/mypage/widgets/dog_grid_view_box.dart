import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/mypage/my_page_view_model.dart';
import 'package:pet_4_ever/user_data.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/add_profile_box.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/dog_profile_box.dart';

//그리드뷰 영역

class DogGridViewBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(myPageViewModel);
      return Expanded(
        child: Container(
          color: Color(0xffFFEFC1),
          child: GridView.builder(
            padding: EdgeInsets.only(bottom: 100, top: 20, left: 10, right: 10),
            itemCount: state.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              //등록된 반려견 없을 때
              if (state.isEmpty || userData.isEmpty) {
                return AddProfileBox();
              }
              //인덱스의 마지막 요소라면 프로필 등록 버튼 추가
              if (index == state.length) {
                return AddProfileBox();
              } else {
                return DogProfileBox(state[index]);
              }
            },
          ),
        ),
      );
    });
  }
}
