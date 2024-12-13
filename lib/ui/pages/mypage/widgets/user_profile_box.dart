import 'package:flutter/material.dart';

//사용자 프로필

class UserProfileBox extends StatelessWidget {
  const UserProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Color(0xffABE5E7),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://picsum.photos/300/400'),
                        ))),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '사용자 아이디',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/images/fence.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/images/fence.png'),
          ),
        ],
      ),
    );
  }
}