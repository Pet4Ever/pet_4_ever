import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/ui/pages/chat/chat_list_page.dart';
import 'package:pet_4_ever/ui/pages/friends/friends_page.dart';
import 'package:pet_4_ever/ui/pages/home/home_view_model.dart';
import 'package:pet_4_ever/ui/pages/home/widgets/home_bottom_navigation_bar.dart';
import 'package:pet_4_ever/ui/pages/mypage/my_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final currentIndex = ref.watch(homeViewModel);
          return IndexedStack(
            index: currentIndex,
            children: [
              FriendsPage(),
              ChatListPage(),
              Mypage(),
            ],
          );
        },
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
