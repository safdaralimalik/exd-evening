import 'package:flutter/material.dart';

class CustomTextFeild extends StatefulWidget {
  final String text;
  final String? hintText;
  final String? Function(String?)? validator;

  final TextEditingController controller;

  const CustomTextFeild(
      {super.key,
      required this.text,
      required this.hintText,
      required this.controller,
      this.validator});

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.text,
        hintText: widget.hintText,
        labelStyle: TextStyle(
          color: Colors.black54,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1.3, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1.3, color: Colors.grey),
        ),
      ),
    );
  }
}
