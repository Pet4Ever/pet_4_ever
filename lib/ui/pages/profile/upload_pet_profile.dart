import 'package:flutter/material.dart';

class UploadPetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새로운 프로필'),
      ),
      body: Container(
        //배경 이미지
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
                Container(
                  //강아지 사진 선택 버튼
                  //TODO imgae_picker 이용해 사진 가지고 오기
                  //TODO 가지고 온 사진 firebase storage에 저장
                  //업로드된 URL을 UserGlobalViewModel의 UserState 클래스 내 String? profileImageUrl;으로 관리

                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.add_a_photo),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      //견종 선택 버튼
                      //TODO 견종 선택 팝업 띄우기 (species)
                      alignment: Alignment.center,
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFFB6066),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '견종',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      //TODO 크기 선택 팝업 띄우기 (size)
                      alignment: Alignment.center,
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFFB6066),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '크기',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      //성별 선택 버튼
                      //TODO 성별 선택 팝업 띄우기 (gender)
                      alignment: Alignment.center,
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFFB6066),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '성별',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      //나이 선택 버튼
                      //TODO 나이 선택 팝업 띄우기 (age)
                      alignment: Alignment.center,
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFFB6066),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '나이',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text('이름'), //TODO 이름 입력 받기
                SizedBox(height: 8),
                Container(
                  //이름 입력 버튼

                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 15),
                Text('한마디'), //TODO 한마디 입력 받기 (MAX10)
                SizedBox(height: 8),
                Container(
                  //한마디 입력 버튼
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 15),
                Text('소개'), //TODO 소개 입력 받기 (MAX500)
                SizedBox(height: 8),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  //등록 버튼
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    backgroundColor: Color(0xFFffce6f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    //TODO 등록 로직 구현
                    print('클릭됨');
                  },
                  child: Text(
                    '등록하기',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
