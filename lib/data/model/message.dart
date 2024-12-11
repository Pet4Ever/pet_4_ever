class Message {
  String id;
  String sender_id;
  String message;
  String createdAt;

  Message({
    required this.id,
    required this.sender_id,
    required this.message,
    required this.createdAt,
  });

  Message.fromJson(Map<String, dynamic> map)
      : this(
          id: map['id'],
          sender_id: map['sender_id'],
          message: map['message'],
          createdAt: map['createdAt'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': sender_id,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
