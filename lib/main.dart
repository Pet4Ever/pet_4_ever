import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_4_ever/data/repository/friends_repository.dart';
import 'package:pet_4_ever/firebase_options.dart';
import 'package:pet_4_ever/theme.dart';
import 'package:pet_4_ever/ui/pages/friends/friends_page.dart';
import 'package:pet_4_ever/ui/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final friendsRepository = FriendsRepository();
  await friendsRepository.getAll();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FriendsPage(),
    );
  }
}
