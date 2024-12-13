import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/image_picker.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/dog_age.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/dog_breeds.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/selected_button.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/text_input.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/upload_button.dart';

class UploadPetProfile extends StatefulWidget {
  @override
  State<UploadPetProfile> createState() => _UploadPetProfileState();
}

class _UploadPetProfileState extends State<UploadPetProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController oneLineController = TextEditingController();
  final TextEditingController introductionController = TextEditingController();

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    oneLineController.dispose();
    introductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('새로운 프로필'),
        ),
        body: Container(
          // 배경이미지
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagePickerWidget(
                    onImageSelected: (File image) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SelectedButton(text: '견종', items: dogBreeds),
                      SizedBox(width: 10),
                      SelectedButton(text: '크기', items: ['소형', '중형', '대형']),
                      SizedBox(width: 10),
                      SelectedButton(text: '성별', items: ['남', '여']),
                      SizedBox(width: 10),
                      SelectedButton(text: '나이', items: dogAge),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('이름'),
                  SizedBox(height: 4),
                  textInput(
                    height: '40',
                    controller: nameController,
                    hintText: '이름',
                    maxLength: 10,
                    maxLines: 1,
                    formKey: formKey1,
                  ),
                  SizedBox(height: 15),
                  Text('한마디'),
                  SizedBox(height: 4),
                  textInput(
                    height: '40',
                    controller: oneLineController,
                    hintText: '한마디',
                    maxLength: 10,
                    maxLines: 1,
                    formKey: formKey2,
                  ),
                  SizedBox(height: 15),
                  Text('소개'),
                  SizedBox(height: 4),
                  textInput(
                    height: '300',
                    controller: introductionController,
                    hintText: '소개',
                    maxLength: 200,
                    maxLines: 5,
                    formKey: formKey3,
                  ),
                  SizedBox(height: 20),
                  uploadButton(formKey1, formKey2, formKey3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
