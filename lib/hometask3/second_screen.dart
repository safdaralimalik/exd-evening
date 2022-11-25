import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String maintext;
  final String firstscreentext;
  const SecondScreen(
      {super.key, required this.firstscreentext, required this.maintext});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            Text(
              "Text Receive from First file ${widget.firstscreentext}",
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
                Navigator.of(context).pop();
                Navigator.of(context).pop();
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
                child: const Text("Navigate to main Screen"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
