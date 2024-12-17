import 'package:flutter/material.dart';
import 'package:pet_4_ever/data/model/pet.dart';

class GoToChatButton extends StatelessWidget {
  Pet pet;
  GoToChatButton(this.pet);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        // final chatRepo = ChatRepository();
        // final chat = await chatRepo.findChat(pet.id);
        // if (chat != null) {
        //   Navigator.push(context, MaterialPageRoute(
        //     builder: (context) {
        //       return ChatDetailPage(chat);
        //     },
        //   ));
        // } else {
        //   final newChat = await chatRepo.createAndReturnChat(
        //     pet_id: pet.id,
        //     users: [pet.owner_id, UserData().currentUser!.uid],
        //   );
        //   if (newChat != null) {
        //     Navigator.push(context, MaterialPageRoute(
        //       builder: (context) {
        //         return ChatDetailPage(newChat);
        //       },
        //     ));
        //   }
        // }
      },
      icon: Icon(Icons.ac_unit_outlined),
    );
  }
}
