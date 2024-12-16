import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/image_picker.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/dog_age.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/dog_breeds.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button/selected_button.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/text_input.dart';
import 'package:pet_4_ever/ui/pages/profile/upload_button.dart';

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

  File? image;

  String? species;
  String? size;
  String? gender;
  int? age;

  @override
  void dispose() {
    nameController.dispose();
    oneLineController.dispose();
    introductionController.dispose();
    super.dispose();
  }

  void clearFields() {
    setState(() {
      image = null;
      nameController.clear();
      oneLineController.clear();
      introductionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '새로운 프로필',
            style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
          ),
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
                      setState(() {
                        this.image = image;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SelectedButton(
                        text: '견종',
                        items: dogBreeds,
                        onSelected: (value) {
                          setState(() {
                            species = value;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      SelectedButton(
                          text: '크기',
                          items: ['소형', '중형', '대형'],
                          onSelected: (value) {
                            setState(() {
                              size = value;
                            });
                          }),
                      SizedBox(width: 10),
                      SelectedButton(
                          text: '성별',
                          items: ['남', '여', '중성'],
                          onSelected: (value) {
                            setState(() {
                              gender = value;
                            });
                          }),
                      SizedBox(width: 10),
                      SelectedButton(
                          text: '나이',
                          items: dogAge,
                          onSelected: (value) {
                            setState(() {
                              age = int.parse(value);
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    '이름',
                    style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
                  ),
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
                  Text(
                    '한마디',
                    style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
                  ),
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
                  Text(
                    '소개',
                    style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
                  ),
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
                  uploadButton(
                    context,
                    formKey1,
                    formKey2,
                    formKey3,
                    image,
                    species ?? '시고르자브종',
                    size ?? '몰라요',
                    gender ?? '몰라요',
                    age ?? 0,
                    nameController.text,
                    oneLineController.text,
                    introductionController.text,
                    clearFields,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
