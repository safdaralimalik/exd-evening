import 'package:flutter/material.dart';
import 'package:week_3/hometask3/first_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textcontroller,
              decoration: const InputDecoration(),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return FirstScreen(
                        maintext: textcontroller.text,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                height: 100,
                width: 190,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue,
                ),
                child: const Text("Navigate to first Screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
