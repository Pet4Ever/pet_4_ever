import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/home/home_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/auth_view_model.dart';
import 'package:pet_4_ever/ui/pages/login_join/join_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/email_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';
import 'package:pet_4_ever/ui/widgets/dog_snack_bar.dart';
import 'package:pet_4_ever/ui/widgets/logo_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  // 나중에 여기서 뷰모델 연동!
  // 로그인시 페이지 이동
  // 스낵바
  void onLoginClick(BuildContext context, WidgetRef ref) async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        // AuthRepository 로그인 함수 호출
        await ref.read(authViewModelProvider.notifier).login(
              emailController.text,
              pwController.text,
            );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false,
        );
      } catch (e) {
        // 로그인 실패(예외 유형 따라 다른 스낵바 표시)
        ScaffoldMessenger.of(context).showSnackBar(
          dogSnackBar(
            e.toString().replaceFirst('Exception: ', ''),
            backgroundColor: Color(0xFFFB6066),
          ),
        );
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
                onPressed: () => onLoginClick(context, ref),
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
