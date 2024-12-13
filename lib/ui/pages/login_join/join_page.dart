import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/login_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/email_text_form_field.dart';
import 'package:pet_4_ever/ui/widgets/logo_text.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/name_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';

class JoinPage extends StatefulWidget {
  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserCredential? userCredential;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 회원가입 버튼 함수
  void onJoin() async {
    if (formKey.currentState?.validate() ?? false) {
      // 유효성 검사 성공한 경우에만 회원가입 가능
      try {
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: pwController.text,
        );
        final uid = userCredential?.user?.uid;
        final name = nameController.text;
        final colRef = FirebaseFirestore.instance.collection('user');
        final docRef = colRef.doc();
        await docRef.set({
          'address': "",
          'name': name,
          'id': uid,
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("회원가입 실패");
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
