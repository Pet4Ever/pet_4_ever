import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/chat/chat_view_model.dart';

class GoToChatButton extends StatelessWidget {
  Pet pet;
  GoToChatButton(this.pet);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // final chat = 
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (context) {
        //     return ChatDetailPage(chat);
        //   },
        // ));
      },
      icon: Icon(Icons.ac_unit_outlined),
    );
  }
}
