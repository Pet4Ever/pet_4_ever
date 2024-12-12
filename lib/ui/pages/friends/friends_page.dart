import 'package:flutter/material.dart';
import 'package:pet_4_ever/theme.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('우리사이')), // TODO: appbar theme
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4, // 가로/세로 가로:세로
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            //Image.network("https://picsum.photos/200");
            return Container(
                width: 115,
                height: 145,
                child: Column(
                  children: [
                    // 강쥐 사진
                    Container(
                      width: 115,
                      height: 92,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/200'),
                            fit: BoxFit.cover),
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
                            Text('멍멍이'),
                            Text('산책하는 시바'),
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
