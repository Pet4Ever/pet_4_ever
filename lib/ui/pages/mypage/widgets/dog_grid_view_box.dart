import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/add_profile_box.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/dog_profile_box.dart';

//그리드뷰 영역

class DogGridViewBox extends StatelessWidget {

  final int sampleCount;
  DogGridViewBox(this.sampleCount);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xffFFEFC1),
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: 100, top: 20, left: 10, right: 10),
          itemCount: sampleCount + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            childAspectRatio: 2 / 3, 
            mainAxisSpacing: 10 
          ),
          itemBuilder: (context, index) {
            //등록된 반려견 없을 때
            if (sampleCount == 0) {
              return AddProfileBox();
            }
            //인덱스의 마지막 요소라면 프로필 등록 버튼 추가
            if (index == sampleCount) {
              return AddProfileBox();
            } else {
              return DogProfileBox(index);
            }
          },
        ),
      ),
    );
  }
}
