import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:pet_4_ever/ui/pages/mypage/my_page.dart';

ElevatedButton uploadButton(
  BuildContext context,
  GlobalKey<FormState> formKey1,
  GlobalKey<FormState> formKey2,
  GlobalKey<FormState> formKey3,
  File? image,
  String species,
  String size,
  String gender,
  int age,
  String name,
  String oneLiner,
  String introduction,
  VoidCallback clearFields,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 40),
      backgroundColor: Color(0xFFffce6f),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () async {
      bool isForm1Valid = formKey1.currentState!.validate();
      bool isForm2Valid = formKey2.currentState!.validate();
      bool isForm3Valid = formKey3.currentState!.validate();
      bool isNameValid = name.isNotEmpty;
      bool isAgeValid = age >= 0;
      bool isSpeciesValid = species.isNotEmpty;

      if (isForm1Valid &&
          isForm2Valid &&
          isForm3Valid &&
          isNameValid &&
          isAgeValid &&
          isSpeciesValid) {
        // print(name);
        if (image != null) {
          // Firebase Storage에 이미지 업로드
          try {
            final storageRef = FirebaseStorage.instance
                .ref()
                .child('${image.path.split('/').last}');
            await storageRef.putFile(image);
            final downloadUrl = await storageRef.getDownloadURL();

            // Firestore에 프로필 정보 업로드
            final firestore = FirebaseFirestore.instance;
            await firestore.collection('pet').add({
              'species': species,
              'size': size,
              'gender': gender,
              'age': age,
              'name': name,
              'specialNotes': oneLiner,
              'introduction': introduction,
              'imageUrl': downloadUrl,
            });

            // 선택한 값 초기화
            clearFields();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mypage()),
            );
          } catch (e) {}
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                content: Text(
                  '강아지 사진을 선택해 주세요.',
                  style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Color(0xFFFB6066),
                        fontFamily: 'Cafe24Ssurround-v2.0',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        // print('유효성 검사 실패');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              content: Text(
                '강아지 정보를 입력해 주세요.',
                style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    '확인',
                    style: TextStyle(
                      color: Color(0xFFFB6066),
                      fontFamily: 'Cafe24Ssurround-v2.0',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    },
    child: Text(
      '등록하기',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Cafe24Ssurround-v2.0',
      ),
    ),
  );
}
