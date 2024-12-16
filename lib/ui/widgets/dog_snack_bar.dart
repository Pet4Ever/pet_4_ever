import 'package:flutter/material.dart';

SnackBar dogSnackBar(String message, {Color? backgroundColor}) {
  return SnackBar(
    width: 350,
    content: Text(
      message,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: backgroundColor ?? Color(0xFFFFA463),
    duration: Duration(seconds: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    padding: EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
  );
}
