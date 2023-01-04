import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: GetBuilder<LoginScreenController>(
          init: LoginScreenController(),
          builder: (_) {
            return ListView(
              children: [

                GetBuilder<LoginScreenController>(
                    id: _.imageUpdateKey,
                    builder: (logic) {
                  return logic.imageFile!=null?Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.file(logic.imageFile!,fit: BoxFit.cover,)),
                      ),
                    ],
                  ):  TextButton(
                      onPressed:()async{
                        await logic.pickUserProfileImage();
                      },
                      child:Text("Pick Image",style: TextStyle(color: Colors.blue),));
                }),
                TextFormField(
                  controller: _.emailController,
                  validator: _.validateEmail,
                  decoration: InputDecoration(
                      hintText: _.hintEmail

                  ),
                ),
                TextFormField(
                  controller: _.passwordController,
                  validator: _.validatePassword,
                  decoration: InputDecoration(
                      hintText: _.hintPassword

                  ),
                ),

                TextButton(onPressed: () {
                  _.onLoginPressed();
                }, child: Text("Login"))
              ],
            );
          }),

    );
  }
}
