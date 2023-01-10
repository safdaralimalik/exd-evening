import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/login_screen_controller.dart';
import 'package:getx_project/screens/phone_no_registration_screen.dart';

import 'package:getx_project/screens/user_profile_screen.dart';
import 'package:getx_project/screens/welcome_screen.dart';
import 'package:getx_project/widgets/custom_text.dart';
import '../widgets/text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffbbb04),
      ////////////////////App Bar ///////////////////////
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.to(const WelcomeScreen());
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                // Get.to(const SignUpScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomText(
                  text: "Register",
                  textColor: Colors.black,
                  textFontSize: 16.toDouble(),
                  textWeight: FontWeight.w600,
                  textAlign: TextAlign.justify,
                ),
              ))
        ],
      ),
      ////////////////////Sign in Start Portion ///////////////////////
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Sign In",
                      textColor: Colors.black,
                      textWeight: FontWeight.bold,
                      textFontSize: 36.toDouble(),
                      textAlign: TextAlign.start),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      textColor: Colors.black,
                      textWeight: FontWeight.w500,
                      textFontSize: 14.toDouble(),
                      textAlign: TextAlign.start),
                ],
              ),
            ),
            ////////////////////Text Form Filed ///////////////////////
            Positioned(
              top: 175,
              child: Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: GetBuilder<LoginScreenController>(
                  init: LoginScreenController(),
                  builder: (_) {
                    return Form(
                      key: _.formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFieldCustomWidget(
                              hinttext: _.emailtext,
                              icons: _.emailicons,
                              controller: _.emailController,
                              validator: _.validateEmail,
                            ),
                            TextFieldCustomWidget(
                              hinttext: _.passwordtext,
                              icons: _.passwordicons,
                              controller: _.passwordController,
                              validator: _.validatePassword,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                  text: "Forgot Password?",
                                  textColor: Colors.black,
                                  textWeight: FontWeight.w500,
                                  textFontSize: 14.toDouble(),
                                  textAlign: TextAlign.end),
                            ),
                            ////////////////////Sign In Button///////////////////////
                            GestureDetector(
                              onTap: () {
                                if (_.formkey.currentState!.validate()) {
                                  _.loginUser(
                                      email: _.emailController.text,
                                      password: _.passwordController.text);
                                  Get.to(const UserProfileScreen());
                                  _.onpressed();
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Center(
                                    child: CustomText(
                                        text: "Sign In",
                                        textColor: Colors.white,
                                        textWeight: FontWeight.bold,
                                        textFontSize: 18.toDouble(),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            ),
                            ///////////////////////Google Auth///////////////////////
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _
                                        .signWithGoogle()
                                        .then((UserCredential value) {
                                      Get.to(const UserProfileScreen());
                                    });
                                  },
                                  child: Container(
                                      height: 60,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: const Color(0xfff4f3f1),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            "assets/images/google.png",
                                            scale: 3.9,
                                          ),
                                          CustomText(
                                              text:
                                                  "Continue with Google      ",
                                              textColor: Colors.black,
                                              textWeight: FontWeight.bold,
                                              textFontSize: 18.toDouble(),
                                              textAlign: TextAlign.start),
                                          const Icon(Icons.arrow_forward_ios)
                                        ],
                                      )),
                                ),
                                ///////////////////////Facebook Auth///////////////////////
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _
                                        .signInWithFacebook()
                                        .then((UserCredential value) {
                                      Get.to(const UserProfileScreen());
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff4f3f1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          "assets/images/fblogo.png",
                                          scale: 8.1,
                                        ),
                                        CustomText(
                                            text: "Continue with Facebook",
                                            textColor: Colors.black,
                                            textWeight: FontWeight.bold,
                                            textFontSize: 18.toDouble(),
                                            textAlign: TextAlign.start),
                                        const Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),
                                ),
                                ///////////////////////phone Number Auth///////////////////////
                                const SizedBox(
                                  height: 8,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen(),
                                        ));
                                  },
                                  child: Container(
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfff4f3f1),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.phone_android,
                                          size: 40,
                                          color: Colors.black,
                                        ),
                                        CustomText(
                                            text: "Continue with Phone     ",
                                            textColor: Colors.black,
                                            textWeight: FontWeight.bold,
                                            textFontSize: 18.toDouble(),
                                            textAlign: TextAlign.start),
                                        const Icon(Icons.arrow_forward_ios)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
