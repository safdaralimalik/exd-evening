import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String buttonText;
  final Color buttoncolor;

  final Color textcolor;
  CustomButton(
      {super.key,
      required this.buttonText,
      required this.buttoncolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: buttoncolor,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
              color: textcolor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
