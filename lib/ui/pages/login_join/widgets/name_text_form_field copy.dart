

import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/login_join/core/validator_util.dart';

class NameTextFormField extends StatelessWidget {
  NameTextFormField({
    required this.controller,
  });
  TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: ValidatorUtil.validatorName,
    );
  }

}