import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//https://youngjumoney.tistory.com/12

class ImagePickerWidget extends StatefulWidget {
  final Function(File) onImageSelected;

  const ImagePickerWidget({Key? key, required this.onImageSelected})
      : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? image; // 이미지 저장할 변수
  final ImagePicker picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedFile = //갤러링에서 이미지 가져오기
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path); //이미지를 File 형태로 저장
      });
      widget.onImageSelected(image!); // 이미지를 부모 위젯에 전달
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _getImage,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: image == null
            ? const Icon(Icons.add_a_photo)
            : ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(image!, fit: BoxFit.cover),
              ),
      ),
    );
  }
}
