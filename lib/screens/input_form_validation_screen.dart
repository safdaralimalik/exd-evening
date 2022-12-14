import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(25),
            children: [
              TextFormField(
                validator: (String? input){
                  String pattern =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regex = RegExp(pattern);
                  if(input==null||input.isEmpty){
                      return "Please type your email";
                  }else if(!regex.hasMatch(input)){
                    return "please enter valid email";
                  }else if(!input.contains("gmail")){

                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Type your email",

                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                validator: (String? input){
                  if(input==null||input.isEmpty){
                    return "Please type your password";
                  }else if(input.length<6){
                    return "Please enter at least 6 digits";
                  }
                  return null;
                },
              obscureText: true,
                decoration: InputDecoration(
                  hintText: "Type your Password",

                ),
              ),
              TextButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  print("LoggedIn");
                }
              }, child: Text("Login"))
            ],
          ),
        ),
      ),
    );
  }
}
