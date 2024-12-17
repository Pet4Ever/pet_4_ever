import 'package:flutter/material.dart';

Form textInput({
  required String height,
  required TextEditingController controller,
  required String hintText,
  int? maxLength,
  int? maxLines,
  GlobalKey<FormState>? formKey,
}) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          textInputAction: TextInputAction.done, //
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: '$hintText',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
            contentPadding: EdgeInsets.symmetric(
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: TextStyle(color: Colors.red),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$hintText 입력해 주세요.';
            }
            return null;
          },
        ),
      ],
    ),
  );
}
