import 'package:flutter/material.dart';

Container imagePicker() {
  return Container(
    //강아지 사진 선택 버튼
    //TODO imgae_picker 이용해 사진 가지고 오기
    //TODO 가지고 온 사진 firebase storage에 저장
    //업로드된 URL을 UserGlobalViewModel의 UserState 클래스 내 String? profileImageUrl;으로 관리

    height: 80,
    width: 80,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Icon(Icons.add_a_photo),
  );
}
