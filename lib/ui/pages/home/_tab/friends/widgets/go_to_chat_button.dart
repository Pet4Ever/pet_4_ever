import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_4_ever/constant.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/repository/chat_repository.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:pet_4_ever/user_data.dart';

class GoToChatButton extends StatelessWidget {
  Pet pet;
  GoToChatButton(this.pet);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final chatRepo = ChatRepository();
        final chat = await chatRepo.findChat(pet.id);
        print('chat == $chat');
        if (chat != null) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ChatDetailPage(chat);
            },
          ));
        } else {
          final newChat = await chatRepo.createAndReturnChat(
            pet_id: pet.id,
            users: [pet.owner_id, UserData().currentUser!.uid],
          );
          if (newChat != null) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ChatDetailPage(newChat);
              },
            ));
          }
        }
      },
      icon: SvgPicture.asset(
        PAW,
        width: 30,
        height: 30,
      ),
    );
  }
}
