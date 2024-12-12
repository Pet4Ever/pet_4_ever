import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/image_picker.dart';
import 'package:pet_4_ever/ui/pages/profile/widgets/selected_button.dart';
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
                  imagePicker(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      selectedButton('견종'),
                      SizedBox(width: 10),
                      selectedButton('크기'),
                      SizedBox(width: 10),
                      selectedButton('성별'),
                      SizedBox(width: 10),
                      selectedButton('나이'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('이름'), //TODO 이름 입력 받기
                  SizedBox(height: 4),
                  textInput(
                    height: '40',
                    controller: nameController,
                    hintText: '이름을',
                    maxLength: 10,
                    maxLines: 1,
                  ),
                  SizedBox(height: 15),
                  Text('한마디'), //TODO 한마디 입력 받기 (MAX10)
                  SizedBox(height: 4),
                  textInput(
                    height: '300',
                    controller: oneLineController,
                    hintText: '한마디를',
                    maxLength: 10,
                    maxLines: 1,
                  ),
                  SizedBox(height: 15),
                  Text('소개'), //TODO 소개 입력 받기 (MAX500)
                  SizedBox(height: 4),
                  textInput(
                    height: '300',
                    controller: introductionController,
                    hintText: '소개를',
                    maxLength: 200,
                    maxLines: 5,
                  ),
                  SizedBox(height: 20),
                  uploadButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
