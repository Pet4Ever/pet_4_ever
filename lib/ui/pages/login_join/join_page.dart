import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/login_join/auth_view_model.dart';
import 'package:pet_4_ever/ui/pages/login_join/login_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/email_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/name_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';
import 'package:pet_4_ever/ui/widgets/logo_text.dart';

// 1. 유저 레포지토리 회원정보 저장하는 함수 만들기 ---
// 2. 뷰모델 만들기 뷰모델 안에서 유저레포지토리 호출
// 3. 조인페이지(위젯)에서 뷰모델 함수 호출
class JoinPage extends ConsumerStatefulWidget {
  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 회원가입 버튼 함수
  void onJoin(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState?.validate() ?? false) {
      // 유효성 검사 성공한 경우에만 회원가입 가능
      //   try {
      //     // 회원가입 (Firebase)
      //     userCredential =
      //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: emailController.text,
      //       password: pwController.text,
      //     );
      //     final uid = userCredential?.user?.uid;
      //     final name = nameController.text;
      //   } on FirebaseAuthException catch (e) {
      //     if (e.code == 'weak-password') {
      //       print('The password provided is too weak.');
      //     } else if (e.code == 'email-already-in-use') {
      //       print('The account already exists for that email.');
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(
      //           content: Text(
      //             '이미 사용중인 이메일 입니다',
      //             style: TextStyle(
      //               fontSize: 15,
      //               fontWeight: FontWeight.bold,
      //             ),
      //             textAlign: TextAlign.center,
      //           ),
      //           backgroundColor: Color(0xFFFFA463),
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20)),
      //           behavior: SnackBarBehavior.floating,
      //           elevation: 1,
      //         ),
      //       );
      //     }
      //   } catch (e) {
      //     print(e);
      //   }
      // } else {
      //   print("회원가입 실패");
      // }
      // 유효성 검사 성공시 회원가입 가능
      final name = nameController.text;
      final email = emailController.text;
      final password = pwController.text;

      await ref
          .read(authViewModelProvider.notifier)
          .join(email, password, name);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '회원가입이 완료되었습니다!',
          ),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
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
                onPressed: () async {
                  onJoin(context, ref);
                  // 호출
                },
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
