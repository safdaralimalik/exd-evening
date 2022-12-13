import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String hinttext;
  final String label;
  final bool obscuretext;
  final bool isLogin;
  final bool isPassword;
  final TextEditingController controller;
  const TextInputField(
      {Key? key,
      required this.hinttext,
      required this.controller,
      required this.label,
      this.obscuretext = false,
      this.isLogin = false,
      this.isPassword = false,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (isLogin) {
          if (!value.contains("@gmail")) {
            return ("username should contains @gmail");
          }
        } else if (isPassword) {
          RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          var passNonNullValue = value;
          if (passNonNullValue.isEmpty) {
            return ("Password is required");
          } else if (passNonNullValue.length < 6) {
            return ("Password Must be more than 5 characters");
          } else if (!regex.hasMatch(passNonNullValue)) {
            return ("Password should contain upper,lower,digit and Special character ");
          }
        }
        return null;
      },
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hinttext,
        label: Text(label),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.black), //<-- SEE HERE
        ),
      ),
    );
  }
}
