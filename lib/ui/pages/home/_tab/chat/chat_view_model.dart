import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/model/chat.dart';
import 'package:pet_4_ever/data/repository/chat_repository.dart';

class ChatViewModel extends Notifier<List<Chat>> {
  @override
  List<Chat> build() {
    getChatList();
    return [];
  }

  Future<void> getChatList() async {
    final chatRepo = ChatRepository();
    final stream = chatRepo.chatListStream();
    final streamSubscription = stream.listen((chats) {
      state = chats;
    });
    ref.onDispose(() {
      streamSubscription.cancel();
    });
  }
}

final chatViewModel = NotifierProvider<ChatViewModel, List<Chat>>(
  () => ChatViewModel(),
);
