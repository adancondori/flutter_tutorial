import 'package:firebase_crud/add_name_page.dart';
import 'package:firebase_crud/firebase_firestore.dart';
import 'package:firebase_crud/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/addName': (context) => AddName(),
      },
    );
  }
}
