import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/data/model/pet.dart';
import 'package:pet_4_ever/data/model/user_model.dart';

class Chat {
  String id;
  String pet_id;
  List<String> users;
  Message? recentMessage;
  Pet? pet;
  UserModel? owner;

  Chat({
    required this.id,
    required this.pet_id,
    required this.users,
    required this.recentMessage,
    required this.pet,
    required this.owner,
  });

  Chat.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          pet_id: map['pet_id'],
          users: List.from(map['users']),
          recentMessage: map['recentMessage'] != null
              ? Message.fromJson(map['recentMessage'])
              : null,
          pet: map['pet'] != null ? Pet.fromJson(map['pet']) : null,
          owner: map['owner'] != null ? UserModel.fromJson(map['owner']) : null,
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pet_id': pet_id,
      'users': users,
    };
  }
}
