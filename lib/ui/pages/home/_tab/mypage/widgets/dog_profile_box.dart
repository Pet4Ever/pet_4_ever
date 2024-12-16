import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/my_page_view_model.dart';

//반려견 프로필

class DogProfileBox extends StatelessWidget {
  final Pet pet;
  DogProfileBox(this.pet);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            //강아지 프로필 눌렀을 때 상세 정보 보여주기
            GestureDetector(
              onTap: () {
                showDogDetail(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).highlightColor),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: (pet.imageUrl != null)
                            ? Image.network(
                                pet.imageUrl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 120,
                              )
                            : SizedBox(
                                height: 120,
                                width: double.infinity,
                              )),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${pet.name} (${pet.age} 살)',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            //반려견 상태 활성화/비활성화 버튼
            GestureDetector(
              onTap: () {
                ref.read(myPageViewModel.notifier).toggleOnoff(pet.name!);
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 44,
                  height: 44,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(CupertinoIcons.checkmark_alt_circle,
                        color: pet.visibility! ? Colors.green : Colors.white
                        //color: Colors.white,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  //반려견 상세 정보 바텀 시트로 구현
  Future<dynamic> showDogDetail(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.lightYellow, // 모달 배경색
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '내 강아지 정보',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    '이름: ${pet.name}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('나이: ${pet.age} 살',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('종: ${pet.species}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('크기: ${pet.size}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('특이사항: ${pet.special_notes}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          );
        });
  }
}
