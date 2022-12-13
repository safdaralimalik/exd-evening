import 'package:flutter/material.dart';

import '../widget/input_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  final _loginContoller = TextEditingController();
  final _passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputField(
                controller: _loginContoller,
                title: "Email",
                hinttext: "Enter your email",
                label: "Email",
                isLogin: true,
              ),
              const SizedBox(
                height: 10,
              ),
              TextInputField(
                controller: _passwordContoller,
                title: "Password",
                hinttext: "Enter your Password",
                label: "Password",
                isPassword: true,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Submit Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
