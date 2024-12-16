import 'package:flutter/material.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/friends/widgets/pet_image.dart';

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
                                    SizedBox(height: 10),
                                    Text(
                                        "${pet.species}/${pet.size}/${pet.age}/${pet.gender}")
                                  ],
                                )
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
      child: Container(
          width: 115,
          height: 145,
          decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              // 강쥐 사진
              PetImage(
                pet: pet,
              ),
              // 텍스트
              SizedBox(height: 13),
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
                        pet.special_notes ?? "냉 무",
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
