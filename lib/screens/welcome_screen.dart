import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/screens/sign_in.dart';
import 'package:getx_project/screens/sign_up.dart';
import 'package:getx_project/widgets/button_custom_widget.dart';
import 'package:getx_project/widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: 130,
            child: Image.asset(
              'assets/images/fb.png',
              height: 130,
              width: 130,
            ),
          ),
          Positioned(
            top: 250,
            left: 80,
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Welcome to Social World',
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                  speed: const Duration(milliseconds: 250),
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 250),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xfffbbb04),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: CustomText(
                              text: "Welcome",
                              textColor: Colors.black,
                              textWeight: FontWeight.bold,
                              textFontSize: 30.toDouble(),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomText(
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          textColor: Colors.black,
                          textWeight: FontWeight.w500,
                          textFontSize: 14.toDouble(),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(const SignInScreen());
                            },
                            child: CustomButton(
                                buttonText: 'Sign In',
                                buttoncolor: Colors.black,
                                textcolor: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const SignUpScreen());
                            },
                            child: CustomButton(
                                buttonText: 'Sign Up',
                                buttoncolor: Colors.white,
                                textcolor: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
