import 'dart:convert';

import 'package:pet_4_ever/data/model/message.dart';

class Chat {
  String id;
  String pet_id;
  List<String> users;
  Message? recentMessage;

  Chat({
    required this.id,
    required this.pet_id,
    required this.users,
    required this.recentMessage,
  });

  Chat.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          pet_id: map['pet_id'],
          users: List.from(map['users']),
          recentMessage: map['recentMessage'] != null
              ? Message.fromJson(map['recentMessage'])
              : null,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pet_id': pet_id,
      'users': users,
    };
  }
}
