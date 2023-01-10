import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:getx_project/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Get.to(const WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                    color: Color(0xfffbbb04),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                      200,
                    )))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/fb.png",
                  height: 200,
                  width: 200,
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Facebook',
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 400),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 400),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                height: 250,
                width: 210,
                decoration: const BoxDecoration(
                    color: Color(0xfffbbb04),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                      200,
                    )))),
          )
        ],
      ),
    );
  }
}
