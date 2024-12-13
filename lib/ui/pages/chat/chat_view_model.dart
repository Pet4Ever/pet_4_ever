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
    final chats = await chatRepo.getChatList();
    print("chats :: $chats");
    state = chats ?? [];
  }

//   Future<void> getAllPosts() async {
//   final postRepo = PostRepository();
//   // final posts = await postRepo.getAll();
//   // state = posts ?? [];
//   final stream = postRepo.postListStream();
//   final streamSubscription = stream.listen((posts) {
//     state = posts;
//   });
//   ref.onDispose(() {
//     streamSubscription.cancel();
//   });
// }
}

final chatViewModel = NotifierProvider<ChatViewModel, List<Chat>>(
  () => ChatViewModel(),
);
