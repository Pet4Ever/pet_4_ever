import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/message_view_model.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/widgets/chat_detail_list_view.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/chat/chat_list_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/widgets/pet_image.dart';
import 'package:pet_4_ever/user_data.dart';

class ChatDetailPage extends StatelessWidget {
  Chat chat;
  ChatDetailPage(this.chat);

  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatListPage(),
            ));
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(chat.owner?.name ?? ''),
            centerTitle: true,
          ),
          body: Column(
            children: [
              chatTitleBar(),
              ChatDetailListView(chat),
              chatInputSendBar(),
            ],
          ),
        ),
      ),
    );
  }

  Container chatInputSendBar() {
    return Container(
      color: Colors.yellow[200],
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () async {
                  // print("메세지 전송 버튼");
                  final vm = ref.read(messageViewModel(chat).notifier);
                  final sendResult = await vm.sendMessage(
                    chat_id: chat.id,
                    sender_id: UserData().currentUser!.uid,
                    message: messageController.text,
                  );

                  if (sendResult) messageController.text = '';
                },
                icon: Icon(
                  Icons.pets,
                  size: 30,
                  color: Colors.brown,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container chatTitleBar() {
    return Container(
      color: Colors.yellow[200],
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: PetImage(pet: chat.pet)),
          ),
          SizedBox(width: 10),
          Text(
            chat.pet?.name ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
            ": ${chat.pet?.special_notes ?? ''}",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
