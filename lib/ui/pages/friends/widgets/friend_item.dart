import 'package:flutter/material.dart';
import 'package:pet_4_ever/data/model/pet.dart';

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 300,
                child: Column(
                  children: [
                    Text(pet.name),
                    Text(pet.species!),
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
                        image: (pet.imageUrl?.isNotEmpty ?? false)
                            ? NetworkImage(pet.imageUrl!)
                            : AssetImage(
                                "assets/images/Rogo.png"), // TODO: default 강아지 아이콘 정의 필요
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
