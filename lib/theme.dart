import 'package:flutter/material.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFCE6F)),
  highlightColor: Color(0xFFFFCE6F),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(Color(0xFFFFCE6F)),
      minimumSize: WidgetStatePropertyAll(Size.fromHeight(52)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontFamily: 'Cafe24Ssurround-v2.0',
          fontSize: 18,
          letterSpacing: 3.0,
        ),
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      vertical: 16,
      horizontal: 15,
    ),
    border: MaterialStateOutlineInputBorder.resolveWith((states) {
      // print(states);
      // 1. states Set 안에 WidgetState.focused가 포함이 되어있을때
      if (states.contains(WidgetState.focused)) {
        return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xFFFFCE6F),
              width: 2,
            ));
      }
      // 2. states Set 안에 WidgetState.error가 포함이 되어있을때
      if (states.contains(WidgetState.error)) {
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFFFB6066),
            width: 2,
          ),
        );
      }
      // 3. 디폴트값
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
          width: 1.5,
        ),
      );
    }),
  ),
);
