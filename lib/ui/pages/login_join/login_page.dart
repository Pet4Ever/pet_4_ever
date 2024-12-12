import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/join_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/id_text_form_field.dart';
import 'package:pet_4_ever/ui/widgets/logo_text.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 나중에 여기서 뷰모델 연동!
  void onLoginClick() async {
    if (formKey.currentState?.validate() ?? false) {}
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
              SizedBox(height: 135),
              Image.asset(
                'assets/images/Rogo.png',
                width: 244,
                height: 235,
              ),
              LogoText(),
              SizedBox(height: 25),
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
                onPressed: onLoginClick,
                child: Text('로그인'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return JoinPage();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '회원가입',
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
