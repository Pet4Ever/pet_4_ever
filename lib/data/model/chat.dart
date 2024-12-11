class Chat {
  String sender;
  String senderId;
  String address;
  String message;
  String createdAt;

  Chat({
    required this.sender,
    required this.senderId,
    required this.address,
    required this.message,
    required this.createdAt,
  });

  Chat.fromJson(Map<String, dynamic> map)
      : this(
          sender: map['sender'],
          senderId: map['senderId'],
          address: map['address'],
          message: map['message'],
          createdAt: map['createdAt'],
        );

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'senderId': senderId,
      'address': address,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
