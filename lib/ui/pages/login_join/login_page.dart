import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/friends/friends_page.dart';
import 'package:pet_4_ever/ui/pages/home/home_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/join_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/email_text_form_field.dart';
import 'package:pet_4_ever/user_data.dart';
import 'package:pet_4_ever/ui/widgets/logo_text.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserCredential? userCredential;

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 나중에 여기서 뷰모델 연동!
  // 로그인시 페이지 이동
  // 스낵바
  void onLoginClick() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        // Firebase 로그인 시도
        userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: pwController.text,
        );

        // 로그인 성공시 동물친구들 페이지로 이동
        if (userCredential?.user != null) {
          // 뒤로가기를 눌렀을때 다시 로그인 페이지로 가지 못하도록
          // Navigator.pushReplacement 해줌
          userData.insert(0, userCredential?.user);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        // 로그인 실패시
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('존재하지 않는 이메일입니다. 다시 시도해주세요'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('비밀번호가 잘못되었습니다. 다시 시도해주세요'),
            ),
          );
        }
      }
    }
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
                '이메일',
                style: TextStyle(fontFamily: 'Cafe24Ssurround-v2.0'),
              ),
              EmailTextFormField(controller: emailController),
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
