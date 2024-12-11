class User {
  String id;
  String name;
  String address;

  User({
    required this.id,
    required this.name,
    required this.address,
  });

  User.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          name: map['name'],
          address: map['address'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }
}
