import 'package:flutter/material.dart';

class FriendItem extends StatelessWidget {
  const FriendItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      image: NetworkImage('https://picsum.photos/200'),
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
                    Text('멍멍이', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('산책하는 시바'),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
