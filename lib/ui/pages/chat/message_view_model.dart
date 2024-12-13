import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/model/message.dart';
import 'package:pet_4_ever/data/repository/message_repository.dart';

class MessageViewModel extends AutoDisposeFamilyNotifier<List<Message>, Chat> {
  @override
  List<Message> build(Chat chat) {
    getAllMessages(chat.id);
    return [];
  }

  final messageRepo = MessageRepository();

  void getAllMessages(String chat_id) {
    final stream = messageRepo.MessageListStream(chat_id);
    final streamSubscription = stream.listen((messages) {
      state = messages;
    });

    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }

  Future<bool> sendMessage({
    required String chat_id,
    required String sender_id,
    required String message,
  }) async {
    final result = await messageRepo.sendMessage(
      chat_id: chat_id,
      sender_id: sender_id,
      message: message,
    );
    return result;
  }
}

final messageViewModel =
    NotifierProvider.autoDispose.family<MessageViewModel, List<Message>, Chat>(
  () => MessageViewModel(),
);
