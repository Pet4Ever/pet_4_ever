class Chat {
  String id;
  String pet_id;
  List<String> users;

  Chat({
    required this.id,
    required this.pet_id,
    required this.users,
  });

  Chat.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          pet_id: map['pet_id'],
          users: List.from(map['users']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pet_id': pet_id,
      'users': users,
    };
  }
}
