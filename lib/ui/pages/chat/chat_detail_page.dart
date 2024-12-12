import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/chat/widgets/chat_detail_list_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatDetailPage(),
    );
  }
}

final OWNER_NAME = "찡찡이 엄마";
final SAMPLE_IMAGE_URL = "https://picsum.photos/200/300";
final SAMPLE_PET_NAME = "찰리(3)";
final SAMPLE_PET_MESSAGE = "나는 금발이 좋아!";

class ChatDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(OWNER_NAME),
        centerTitle: true,
      ),
      body: Column(
        children: [
          chatTitleBar(),
          ChatDetailListView(),
          chatInputSendBar(),
        ],
      ),
    );
  }

  Container chatInputSendBar() {
    return Container(
          color: Colors.yellow[100],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
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
              IconButton(
                onPressed: () {
                  print("메세지 전송 버튼");
                },
                icon: Icon(
                  Icons.pets,
                  size: 30,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        );
  }

  Container chatTitleBar() {
    return Container(
      color: Colors.yellow[100],
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                SAMPLE_IMAGE_URL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            SAMPLE_PET_NAME,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
            ": $SAMPLE_PET_MESSAGE",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}