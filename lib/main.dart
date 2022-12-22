import 'package:flutter/material.dart';
import 'package:local_storage_app/config/object_box.dart';
import 'package:local_storage_app/screens/home_screen.dart';

late final ObjectBox objectBox;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  objectBox=await ObjectBox.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Storage App',
      home:HomeScreen(),
    );
  }
}

