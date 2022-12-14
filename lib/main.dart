import 'package:flutter/material.dart';
import 'package:week_3/screens/bottom_nev_example/bottom_nev_home_screen.dart';
import 'package:week_3/screens/drawer_test_screen.dart';
import 'package:week_3/screens/input_form_validation_screen.dart';
import 'package:week_3/screens/stack_test_screen.dart';
import 'package:week_3/screens/whatsapp/whatsapp_tabs_screen.dart';

import 'api_examples/post_list_screen.dart';
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
      home:  const PostListScreen(),
    );
  }
}
