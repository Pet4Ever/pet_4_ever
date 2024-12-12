import 'package:pet_4_ever/data/model/chat.dart';

String userId = "샘플유저아이디";

class ChatRepository {
ChatRepository();

// List<Chat>? getChatList(){
//   try {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('chat').where("users", arrayContains: userId);
//       final result = await collectionRef.get();
//       final docs = result.docs;

//       return docs.map((doc) {
//         final map = {
//           'id': doc.id,
//           ...doc.data(),
//         };
//         return Chat.fromJson(map);
//       }).toList();
//     } catch (e) {
//       print(e);
//       return null;
//     }
// }
}


// class PostRepository {
//   const PostRepository();

//   Future<List<Post>?> getAll() async {
//     try {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('posts');
//       final result = await collectionRef.get();
//       final docs = result.docs;

//       return docs.map((doc) {
//         final map = {
//           'id': doc.id,
//           ...doc.data(),
//         };
//         return Post.fromJson(map);
//       }).toList();
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
//   List<Chat>? getChatList(){
//   try {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('chat').where("users", arrayContains: userId);
//       final result = await collectionRef.get();
//       final docs = result.docs;

//       return docs.map((doc) {
//         final map = {
//           'id': doc.id,
//           ...doc.data(),
//         };
//         return Chat.fromJson(map);
//       }).toList();
//     } catch (e) {
//       print(e);
//       return null;
//     }
// }

//   // Create
//   Future<bool> insert({
//     required String title,
//     required String content,
//     required String writer,
//     required String imageUrl,
//   }) async {
//     try {
//       final firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('posts');
//       final docRef = collectionRef.doc();

//       await docRef.set({
//         'title': title,
//         'content': content,
//         'writer': writer,
//         'imageUrl': imageUrl,
//         'createdAt': DateTime.now().toIso8601String()
//       });

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   // Read
//   Future<Post?> getOne(String id) async {
//     try {
//       final firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('posts');
//       final docRef = collectionRef.doc(id);

//       final doc = await docRef.get();

//       return Post.fromJson({
//         'id': doc.id,
//         ...doc.data()!,
//       });
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   // Update
//   Future<bool> update({
//     required String id,
//     required String title,
//     required String content,
//     required String writer,
//     required String imageUrl,
//   }) async {
//     try {
//       final firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('posts');
//       final docRef = collectionRef.doc(id);

//       // docRef.set(data);
//       await docRef.update({
//         'title': title,
//         'content': content,
//         'writer': writer,
//         'imageUrl': imageUrl,
//       });
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   // Delete
//   Future<bool> delete(String id) async {
//     try {
//       final firestore = FirebaseFirestore.instance;
//       final collectionRef = firestore.collection('posts');
//       final docRef = collectionRef.doc(id);

//       await docRef.delete();

//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }

//   Stream<List<Post>> postListStream() {
//     final firestore = FirebaseFirestore.instance;
//     final collectionRef = firestore.collection('posts').orderBy('createdAt', descending: true);
//     final stream = collectionRef.snapshots();

//     return stream.map((event) {
//       return event.docs.map((doc) {
//         return Post.fromJson({
//           'id': doc.id,
//           ...doc.data(),
//         });
//       }).toList();
//     });
//   }

//   Stream<Post?> postStream(String id) {
//     final firestore = FirebaseFirestore.instance;
//     final collectionRef = firestore.collection('posts');
//     final docRef = collectionRef.doc(id);
//     final stream = docRef.snapshots();

//     return stream.map((doc) {
//       if (doc.data() == null) {
//         return null;
//       }
//       return Post.fromJson({
//         'id': doc.id,
//         ...doc.data()!,
//       });
//     });
//   }
// }
