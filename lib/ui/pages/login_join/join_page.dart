import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/login_join/auth_view_model.dart';
import 'package:pet_4_ever/ui/pages/login_join/login_page.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/email_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/name_text_form_field.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/pw_text_form_field.dart';
import 'package:pet_4_ever/ui/widgets/dog_snack_bar.dart';
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
      final name = nameController.text;
      final email = emailController.text;
      final password = pwController.text;

      try {
        // 회원가입 시도
        await ref
            .read(authViewModelProvider.notifier)
            .join(email, password, name);

        // 회원가입 성공
        ScaffoldMessenger.of(context).showSnackBar(
          dogSnackBar('회원가입 성공!'),
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          dogSnackBar(
            e.toString().replaceFirst('Exception: ', ''),
            backgroundColor: Color(0xFFFB6066),
          ),
        );
      } 
    } else {
      print('회원가입 실패');
      ScaffoldMessenger.of(context).showSnackBar(
        dogSnackBar(
          '회원가입 실패!',
          backgroundColor: Color(0xFFFB6066),
        ),
      );
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
