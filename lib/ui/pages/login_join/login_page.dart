import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/widgets/id_text_form_field.dart';
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
            children: [
              IdTextFormField(controller: idController),
              SizedBox(height: 30),
              PwTextFormField(controller: pwController),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState?.validate();
                },
                child: Text('로그인'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
