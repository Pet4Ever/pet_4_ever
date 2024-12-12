import 'package:flutter/material.dart';

TextField textInput({
  required String height,
  required TextEditingController controller,
  required String hintText,
  int? maxLength,
  int? maxLines,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    maxLength: maxLength,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: '$hintText 작성하세요',
      hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
      contentPadding: EdgeInsets.symmetric(
        //글씨 위치 조정
        horizontal: 10,
        vertical: 15,
      ),
      border: MaterialStateOutlineInputBorder.resolveWith(
        (states) {
          if (states.contains(WidgetState.focused)) {
            return OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            );
          }
          return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          );
        },
      ),
    ),
  );
}
