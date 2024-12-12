import 'package:flutter/material.dart';

ElevatedButton uploadButton() {
  return ElevatedButton(
    //등록 버튼
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 40),
      backgroundColor: Color(0xFFffce6f),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      //TODO 등록 로직 구현
      print('클릭됨');
    },
    child: Text(
      '등록하기',
      style: TextStyle(color: Colors.white),
    ),
  );
}
