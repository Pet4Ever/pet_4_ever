import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/data/model/pet.dart';

class Chat {
  String id;
  String pet_id;
  List<String> users;
  Message? recentMessage;
  Pet pet;

  Chat({
    required this.id,
    required this.pet_id,
    required this.users,
    required this.recentMessage,
    required this.pet,
  });

  Chat.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          pet_id: map['pet_id'],
          users: List.from(map['users']),
          recentMessage: map['recentMessage'] != null
              ? Message.fromJson(map['recentMessage'])
              : null,
          pet: Pet.fromJson(map['pet']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pet_id': pet_id,
      'users': users,
    };
  }
}
