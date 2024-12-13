import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/friends/friends_view_model.dart';

class FriendsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text('우리사이')), // TODO: appbar theme
      // TODO: consumer로 감싸서 구독
      body: friends.isEmpty
          ? Center(child: Text('친구가 없어요.'))
          : GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4, // 가로/세로 가로:세로
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final friend = friends[index];
                return FriendItem(
                  imageUrl: friend.imageUrl,
                  name: friend.name,
                  special_note: friend.special_notes,
                );
              }),
    );
  }
}

class FriendItem extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String? special_note; // TODO: not a lowerCamelCase

  const FriendItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.special_note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bottom sheet 호출
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 300,
                child: Column(
                  children: [
                    Text('멍멍멍'),
                    Text('안녕? 나는 시바야.'),
                  ],
                ),
              );
            });
      },
      child: Container(
          width: 115,
          height: 145,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              // 강쥐 사진
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 115,
                  height: 92,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(imageUrl ??
                            "https://picsum.photos/id/40/200"), // TODO: default 강아지 아이콘 정의 필요
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              // 텍스트
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ), // TODO: name
                      Text(
                        special_note ?? "냉 무",
                        overflow: TextOverflow.ellipsis,
                      ), // TODO: special_note, default 문구
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
