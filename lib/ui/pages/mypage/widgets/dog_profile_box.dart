import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//반려견 프로필

class DogProfileBox extends StatelessWidget {

  int index;
  DogProfileBox(this.index);


  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffFFCE6F)),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://picsum.photos/300/400',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 120,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '강아지 (나이)',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('대표 동물 등록 버튼 터치');
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 44,
                  height: 44,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
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
}
