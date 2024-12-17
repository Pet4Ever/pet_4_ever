import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/constant.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/message_view_model.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/widgets/pet_image.dart';
import 'package:pet_4_ever/user_data.dart';

class ChatDetailListView extends StatelessWidget {
  Chat chat;
  ChatDetailListView(this.chat);

  final scrollController = ScrollController();

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: Duration(milliseconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BACKGROUND_IMAGE_URL),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final messages = ref.watch(messageViewModel(chat));
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (scrollController.hasClients) {
                scrollToBottom();
              }
            });
            // receivedMessage 프로필 표시여부
            bool isFirst = true;
            return Scrollbar(
              controller: scrollController,
              // thumbVisibility: true,
              thickness: 8,
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                // reverse: true,
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = messages[index];
              
                  if (item.sender_id == UserData().currentUser!.uid) {
                    isFirst = true;
                    return sentMessage(item);
                  } else {
                    if (isFirst) {
                      isFirst = false;
                      return receivedMessage(item, true);
                    } else {
                      return receivedMessage(item, false);
                    }
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget sentMessage(Message item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            item.createdAtStr,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            fit: FlexFit.loose,
            child: messageBox(Colors.yellow, item.message),
          ),
        ],
      ),
    );
  }

  Widget receivedMessage(Message item, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox.square(dimension: 50, child: isFirst ? profileImage() : null),
        SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: messageBox(Colors.white, item.message),
                ),
                SizedBox(width: 5),
                Text(
                  item.createdAtStr,
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ClipRRect profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: PetImage(pet: chat.pet),
    );
  }

  Widget messageBox(Color backgroundColor, String message) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        message,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
