import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  final Color textColor;
  final FontWeight textWeight;
  final dynamic textFontSize;
  final TextAlign textAlign;
  CustomText({
    super.key,
    required this.text,
    required this.textColor,
    required this.textWeight,
    required this.textFontSize,
    required this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textFontSize,
        fontWeight: textWeight,
      ),
    );
  }
}
