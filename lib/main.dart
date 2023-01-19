import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_app/db/prefs.dart';

import 'package:firestore_app/screens/chat/rooms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Prefs.initPrefs();
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
      home: const RoomsPage(),
    );
  }
}
