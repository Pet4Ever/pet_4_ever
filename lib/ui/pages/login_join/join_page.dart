import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/login_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/id_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/logo_text.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/name_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';

class JoinPage extends StatefulWidget {
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 회원가입 버튼 함수
  void onJoin() {
    formKey.currentState?.validate();
    print('onJoin');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 42),
            children: [
              SizedBox(height: 130),
              Image.asset(
                'assets/images/Rogo.png',
                width: 125,
                height: 121,
              ),
              LogoText(),
              SizedBox(height: 40),
              Text(
                '새로운 계정 만들기',
                style: TextStyle(
                  fontFamily: 'Cafe24Ssurround-v2.0',
                  fontSize: 23,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '이름',
                style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
              ),
              NameTextFormField(controller: nameController),
              SizedBox(height: 15),
              Text(
                '아이디',
                style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
              ),
              IdTextFormField(controller: idController),
              SizedBox(height: 15),
              Text(
                '비밀번호',
                style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
              ),
              PwTextFormField(controller: pwController),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: onJoin,
                child: Text('회원가입'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '이미 계정이 있으신가요? 로그인',
                    style: TextStyle(
                      fontFamily: 'Cafe24Ssurround-v2.0',
                      fontSize: 13,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
