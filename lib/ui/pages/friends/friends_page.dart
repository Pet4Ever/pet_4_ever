import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/friends/friends_view_model.dart';
import 'package:pet_4_ever/ui/pages/friends/widgets/friend_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FriendsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child:
              SvgPicture.asset("assets/images/mainLogo.svg", fit: BoxFit.cover),
        ),
      ),
      // TODO: consumer로 감싸서 구독
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: friends.isEmpty
            ? Center(child: Text('친구가 없어요.'))
            : GridView.builder(
                padding: EdgeInsets.all(20),
                itemCount: friends.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 4, // 가로/세로 가로:세로
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  final pet = friends[index];
                  return FriendItem(pet: pet);
                }),
      ),
    );
  }
}
