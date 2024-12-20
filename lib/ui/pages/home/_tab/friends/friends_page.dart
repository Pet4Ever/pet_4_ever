import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_4_ever/constant.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/friends_view_model.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/friends/widgets/friend_item.dart';
import 'package:pet_4_ever/ui/pages/home/_tab/mypage/user_data_view_model.dart';

class FriendsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final friends = ref.watch(friendViewModelProvider);
    final user = ref.watch(userDataViewModel);
    final friendsNotifier = ref.read(friendViewModelProvider.notifier);
    friendsNotifier.getAllPets(user.address);
    final friends = ref.watch(friendViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SvgPicture.asset(MAIN_LOGO),
        ),
      ),
      // TODO: consumer로 감싸서 구독
      body: SafeArea(
        child: Stack(
          children: [
            // 배경
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(BACKGROUND_IMAGE_URL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 40,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          '위치: ${user.address}',
                          style: TextStyle(
                            fontFamily: 'Cafe24Ssurround-v2.0',
                            fontSize: 20,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: friends.isEmpty
                      ? Center(child: Text('친구가 없어요.'))
                      : GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: friends.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 3 / 4, // 가로/세로 가로:세로
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            final pet = friends[index];
                            return FriendItem(pet: pet);
                          }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
