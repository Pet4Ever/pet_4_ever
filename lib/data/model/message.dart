import 'package:intl/intl.dart';

class Message {
  String id;
  String sender_id;
  String message;
  DateTime createdAt;

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
          createdAt: DateTime.parse(map['createdAt']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender_id': sender_id,
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String get createdAtDiff {
    final Duration difference = DateTime.now().difference(createdAt);
    if (difference.inMinutes < 1) {
      return '방금 전';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}분 전';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}시간 전';
    } else {
      return '${difference.inDays}일 전';
    }
  }

  String get createdAtStr {
    return DateFormat('a hh:mm').format(createdAt);
  }
}
