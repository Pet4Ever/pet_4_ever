import 'package:flutter/material.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/chat/chat_list_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/widgets/pet_image.dart';

class FriendItem extends StatelessWidget {
  final Pet pet; // Pet 객체를 받도록 수정

  const FriendItem({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bottom sheet 호출
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightYellow,
                  ),
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  height: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pet != null
                          ? Row(
                              // 사진, (이름&설명), 챗 버튼
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child: PetImage(
                                    pet: pet,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(pet.name),
                                    //SizedBox(height: 10),
                                    Text(
                                        "${pet.species} / ${pet.size} / ${pet.age} / ${pet.gender}")
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatListPage(),
                                        ),
                                      );
                                    },
                                    child: Text('발바닥')) // TODO: 채팅 넘어가는 버튼 추가
                              ],
                            )
                          : Text('동물 친구들 데이터가 없습니다.'),
                      SizedBox(height: 20),
                      Text(
                        pet.special_notes!,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: LayoutBuilder(builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / 3 - 20;
        final itemHeight = itemWidth * 4 / 3; // 3:4 ratio

        return Container(
            width: itemWidth,
            height: itemHeight,
            decoration: BoxDecoration(
                color: Theme.of(context).highlightColor,
                borderRadius: BorderRadius.circular(20)),
            // 그리드
            child: Column(
              children: [
                // 강쥐 사진
                PetImage(
                  pet: pet,
                  width: double.infinity,
                  height: 90,
                ),
                // 텍스트
                SizedBox(height: 3),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          pet.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ), // TODO: name
                        Text(
                          pet.special_notes ?? "반가워요!",
                          overflow: TextOverflow.ellipsis,
                        ), // TODO: special_note, default 문구
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
