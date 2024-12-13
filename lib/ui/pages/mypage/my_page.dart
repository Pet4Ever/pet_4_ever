import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/repository/my_page_repository.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/dog_grid_view_box.dart';
import 'package:pet_4_ever/ui/pages/mypage/widgets/user_profile_box.dart';

class Mypage extends StatelessWidget {
  String owner_id = 'AdKG8Aq3FoTGSxWQGQNW';

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ref.read(myPageViewModel.notifier).getPetData(owner_id);
      return Scaffold(
        appBar: AppBar(
          title: Text('우리집'),
        ),
        body: Column(
          children: [
            //사용자 프로필
            UserProfileBox(),
            //반려견 프로필 보여주는 그리드뷰 영역
            DogGridViewBox(),
          ],
        ),
      );
    });
  }
}
