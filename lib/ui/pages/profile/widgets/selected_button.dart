import 'package:flutter/material.dart';

Container selectedButton(String text) {
  return Container(
    //견종 선택 버튼
    //TODO 견종 선택 팝업 띄우기 (species)
    //DropdownButton 사용해서 구현 (https://luvris2.tistory.com/805)
    alignment: Alignment.center,
    height: 30,
    width: 90,
    decoration: BoxDecoration(
      color: Color(0xFFFB6066),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.white),
    ),
  );
}
