import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/user_data_view_model.dart';
import 'package:pet_4_ever/user_data.dart';

class UserProfileBox extends StatelessWidget {
  const UserProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      try {
        User? currentUser = UserData().currentUser;
        ref.read(userDataViewModel.notifier).getUserData(currentUser!.uid);
        final user = ref.watch(userDataViewModel);

        return Container(
          width: double.infinity,
          height: 200,
          color: Color(0xffABE5E7).withOpacity(0.7),
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
                      currentUser.uid.isNotEmpty ? user.name : '사용자 아이디',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              // 울타리 이미지
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
      } catch (e) {
        // 에러가 발생했을 때 사용자에게 메시지 표시
        return Container(
          width: double.infinity,
          height: 200,
          color: Color(0xffABE5E7),
          child: Center(
            child: Text(
              '사용자 정보를 불러오는 중에 오류가 발생했습니다.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      }
    });
  }
}
