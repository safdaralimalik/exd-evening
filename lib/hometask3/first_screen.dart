import 'package:flutter/material.dart';
import 'package:week_3/hometask3/second_screen.dart';

class FirstScreen extends StatefulWidget {
  final String maintext;
  const FirstScreen({super.key, required this.maintext});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Text Receive from main file ${widget.maintext}",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              controller: textcontroller,
              decoration: const InputDecoration(),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondScreen(
                        firstscreentext: textcontroller.text,
                        maintext: widget.maintext,
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
                child: const Text("Navigate to Second Screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
