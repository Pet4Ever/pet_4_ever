import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/ui/pages/chat/chat_detail_page.dart';
import 'package:pet_4_ever/ui/pages/chat/message_view_model.dart';

final SAMPLE_MESSAGE = "샘ㅁ플 메세지 입니다";
final MY_ID = "사용자1";

class ChatDetailListView extends StatelessWidget {
  Chat chat;
  ChatDetailListView(this.chat);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final messages = ref.watch(messageViewModel(chat));
            // receivedMessage 프로필 표시여부
            bool isFirst = true;
            return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final item = messages[index];

                if (item.sender_id == MY_ID) {
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
            );
          },
        ),
      ),
    );
  }

  Widget sentMessage(Message item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "3분전",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(width: 5),
          messageBox(Colors.yellow, item.message),
        ],
      ),
    );
  }

  Widget receivedMessage(Message item, bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox.square(dimension: 50, child: isFirst ? profileImage() : null),
        SizedBox(width: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            messageBox(Colors.white, item.message),
            SizedBox(width: 5),
            Text(
              "3분전",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }

  ClipRRect profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        SAMPLE_IMAGE_URL,
        fit: BoxFit.cover,
      ),
    );
  }

  Container messageBox(Color backgroundColor, String message) {
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
