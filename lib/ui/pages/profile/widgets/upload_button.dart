import 'package:flutter/material.dart';

ElevatedButton uploadButton(
  GlobalKey<FormState> formKey1,
  GlobalKey<FormState> formKey2,
  GlobalKey<FormState> formKey3,
) {
  return ElevatedButton(
    //등록 버튼
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 40),
      backgroundColor: Color(0xFFffce6f),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () async {
      formKey1.currentState!.validate();
      formKey2.currentState!.validate();
      formKey3.currentState!.validate();
    },
    // 유효성 검사 통과

    child: Text(
      '등록하기',
      style: TextStyle(color: Colors.white),
    ),
  );
}
