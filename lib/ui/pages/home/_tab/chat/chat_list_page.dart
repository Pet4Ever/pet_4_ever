import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/constant.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/ui/pages/chat_detail/chat_detail_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/chat/chat_view_model.dart';

import 'package:pet_4_ever/ui/pages/chat_detail/widgets/chat_detail_list_view.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/widgets/pet_image.dart';
import 'package:pet_4_ever/ui/pages/home/home_view_model.dart';
import 'package:pet_4_ever/ui/pages/map/map_page.dart';

class ChatListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("채팅목록"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(BACKGROUND_IMAGE_URL),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final chats = ref.watch(chatViewModel);
            return chats.length > 0 ? chatListView(chats) : emptyChatText();
          },
        ),
      ),
    );
  }

  Widget emptyChatText() {
    return Center(child: Text('채팅이 없습니다'));
  }

  ListView chatListView(List<Chat> chats) {
    return ListView.separated(
      itemCount: chats.length,
      separatorBuilder: (context, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        // if (index == chats.length) {
        //   return IconButton(
        //     onPressed: () {
        //       Navigator.push(context, MaterialPageRoute(
        //         builder: (context) {
        //           final latLng = ref.watch(homeViewModel).latLng;
        //           return MapPage(latLng);
        //         },
        //       ));
        //     },
        //     icon: Icon(Icons.map),
        //   );
        // }
        var item = chats[index];
        return chatListItem(context, item);
      },
    );
  }

  Widget chatListItem(BuildContext context, Chat item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ChatDetailPage(item);
          },
        ));
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 55,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: PetImage(pet: item.pet!)),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.pet!.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "${item.owner?.splitedAddress} * ${item.recentMessage?.createdAtDiff ?? ''}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(item.recentMessage?.message ?? ""),
              ],
            )
          ],
        ),
      ),
    );
  }
}
