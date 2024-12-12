
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProfileBox extends StatelessWidget {
  const AddProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //프로필 등록 페이지로 이동
        print('동물 프로필 추가 버튼 터치');
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        padding: EdgeInsets.all(10),
        child: Icon(
          CupertinoIcons.plus_circled,
          color: Colors.amber,
        ),
      ),
    );
  }
}