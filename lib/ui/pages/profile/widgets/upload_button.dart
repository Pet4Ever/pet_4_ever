import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:pet_4_ever/ui/pages/home/_tab/mypage/my_page.dart';
import 'package:pet_4_ever/user_data.dart';

//TODO MVVM 적용
//TODO 로딩 인디케이터 구현 (https://kimhyeongi.tistory.com/61)
//https://baka9131.tistory.com/20
ElevatedButton uploadButton(
  BuildContext context,
  GlobalKey<FormState> formKey1,
  GlobalKey<FormState> formKey2,
  GlobalKey<FormState> formKey3,
  File? image,
  String? species,
  String? size,
  String? gender,
  int? age,
  String name,
  String oneLiner,
  String introduction,
  VoidCallback clearFields,
  User? currentUser,
) {
  currentUser ??= UserData().currentUser;

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

      bool isAgeValid = age != null && age > 0;
      bool isSpeciesValid = species != null && species.isNotEmpty;
      bool isSizeValid = size != null && size.isNotEmpty;
      bool isGenderValid = gender != null && gender.isNotEmpty;

      List<String> inputErrors = [];
      List<String> selectionErrors = [];

      if (!isForm1Valid) inputErrors.add('이름');
      if (!isForm2Valid) inputErrors.add('한마디');
      if (!isForm3Valid) inputErrors.add('소개');
      if (!isAgeValid) selectionErrors.add('나이');
      if (!isSpeciesValid) selectionErrors.add('견종');
      if (!isSizeValid) selectionErrors.add('크기');
      if (!isGenderValid) selectionErrors.add('성별');
      if (image == null) selectionErrors.add('강아지 사진');

      List<String> errorMessages = [];
      if (inputErrors.isNotEmpty) {
        errorMessages.add('${inputErrors.join(', ')}을(를) 입력해 주세요.');
      }
      if (selectionErrors.isNotEmpty) {
        errorMessages.add('${selectionErrors.join(', ')}을(를) 선택해 주세요.');
      }

      if (errorMessages.isNotEmpty) {
        showAlertDialog(context, errorMessages.join('\n'));
      } else {
        if (image != null) {
          showDialog(
            //로딩 인디게이터 시작
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );

          try {
            final storageRef = FirebaseStorage.instance
                .ref()
                .child('${image.path.split('/').last}');
            await storageRef.putFile(image);
            final downloadUrl = await storageRef.getDownloadURL();

            final firestore = FirebaseFirestore.instance;
            await firestore.collection('pet').add({
              'species': species,
              'size': size,
              'gender': gender,
              'age': age,
              'name': name,
              'special_notes': oneLiner,
              'introduction': introduction,
              'imageUrl': downloadUrl,
              'owner_id': currentUser?.uid,
            });

            clearFields();

            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Mypage()),
            );
          } catch (e) {
            print('Error occurred: $e');
            showAlertDialog(context, '업로드 중 오류가 발생했습니다.');
          } finally {
            Navigator.of(context).pop(); //로딩 인디게이터 종료
          }
        }
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

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        content: Text(
          message,
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
