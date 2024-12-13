
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

  void getAllMessages(String chat_id) {
    final messageRepo = MessageRepository();
    final stream = messageRepo.MessageListStream(chat_id);
    final streamSubscription = stream.listen((messages) {
      state = messages;
    });

    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }
}

final messageViewModel =
    NotifierProvider.autoDispose.family<MessageViewModel, List<Message>, Chat>(
  () => MessageViewModel(),
);
