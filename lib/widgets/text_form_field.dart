import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldCustomWidget extends StatelessWidget {
  String hinttext;
  final Icon icons;
  TextEditingController controller;
  final String? Function(String?)? validator;

  TextFieldCustomWidget({
    super.key,
    required this.hinttext,
    required this.icons,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: icons,
        border: InputBorder.none,
        fillColor: const Color(0xfff4f3f1),
        filled: true,
        suffixIconColor: Colors.grey,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey, width: 1.3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
            borderSide: const BorderSide(color: Colors.grey, width: 1.3)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey, width: 1.3)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey, width: 1.3)),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
