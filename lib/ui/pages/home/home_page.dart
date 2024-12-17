import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/core/geolocator_helper.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/chat/chat_list_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/friends_page.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/my_page.dart';
import 'package:pet_4_ever/ui/pages/home/home_view_model.dart';
import 'package:pet_4_ever/ui/pages/home/widgets/home_bottom_navigation_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchAddress();
  }

  Future<void> _fetchAddress() async {
    final position = await GeolocatorHelper.getPositon();
    if (position != null) {
      final vm = ref.read(homeViewModel.notifier);
      vm.getAddress(position.latitude, position.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModel);
    print("지금 주소는!! ${state.address}");
    return Scaffold(
      body: IndexedStack(
        index: state.currentIndex,
        children: [
          FriendsPage(),
          ChatListPage(),
          Mypage(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
