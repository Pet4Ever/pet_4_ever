

import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/core/validator_util.dart';

class PwTextFormField extends StatelessWidget {
  PwTextFormField({
    required this.controller,
  });
  TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: ValidatorUtil.validatorPassword,
      obscureText: true,
    );
  }

}