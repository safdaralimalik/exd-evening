import 'package:flutter/material.dart';
import 'package:week_3/screens/home_task_three.dart';
import 'package:week_3/screens/home_task_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeTaskThree(),
    );
  }
}
