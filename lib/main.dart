import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_app/screens/add_post_screen.dart';
import 'package:firestore_app/screens/all_post_screen.dart';
import 'package:firestore_app/screens/home_acreen.dart';
import 'package:firestore_app/screens/post_list_screen.dart';
import 'package:firestore_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EXD Social App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
