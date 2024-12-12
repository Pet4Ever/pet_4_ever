import 'package:flutter/material.dart';
import 'package:pet_4_ever/ui/pages/chat/chat_detail_page.dart';

final SAMPLE_MESSAGE = "샘ㅁ플 메세지 입니다";

class ChatDetailListView extends StatelessWidget {
  const ChatDetailListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(SAMPLE_IMAGE_URL),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            sentMessage(),
            receivedMessage(true),
            receivedMessage(false),
            sentMessage(),
            sentMessage(),
            receivedMessage(true),
            receivedMessage(false),
            receivedMessage(false),
            sentMessage(),
            receivedMessage(true),
            receivedMessage(false),
            sentMessage(),
            sentMessage(),
            receivedMessage(true),
            receivedMessage(false),
          ],
        ),
      ),
    );
  }

  Widget sentMessage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        messageBox(Colors.yellow, SAMPLE_MESSAGE),
        Text(
          "3분전",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Widget receivedMessage(bool isFirst) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        SizedBox.square(
          dimension: 50,
          child: isFirst ? profileImage() : null
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            messageBox(Colors.white, SAMPLE_MESSAGE),
            Text(
              "3분전",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            )
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

  Container messageBox(Color backgroundColor, String messaage) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        messaage,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
