import 'package:flutter/material.dart';

class RoundedButtonCustomWidget extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const RoundedButtonCustomWidget(
      {super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
