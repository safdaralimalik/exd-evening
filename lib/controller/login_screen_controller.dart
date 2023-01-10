// ignore_for_file: avoid_print

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenController extends GetxController {
  /////////////////////Textediting controller Text Form Field/////////////////

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  ////////////////////////Variable for text formfield///////////////////////////
  String emailtext = 'Email';
  String passwordtext = 'Password';
  Icon emailicons = const Icon(Icons.email);
  Icon passwordicons = const Icon(Icons.lock);

  ////////////////////////Validation for Email///////////////////////////
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Email";
    }
    if (!GetUtils.isEmail(value)) {
      return "Enter Valid Email";
    }
    return null;
  }
  ////////////////////////Validation for Password///////////////////////////

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Your Password";
    }
    if (value.length < 8) {
      return "Enter Valid Password";
    }
    return null;
  }

  ////////////////on pressed method for button//////////////////

  onpressed() {
    Get.snackbar("Sucessfully Logged in", "Login Successful",
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.grey,
        colorText: Colors.white,
        padding: const EdgeInsets.all(10));
    Get.defaultDialog(
        title: "Status", content: const Text("Successfully Logged in"));
  }

//////////////////////////////Firebase Authentication/////////////////////////

  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  // ignore: unused_element
  Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    bool status = false;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // ignore: unused_local_variable
      User? currentUser = credential.user;

      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return status;
  }

  //////////////////////Login with google///////////////////////////////////
  // ignore: unused_element
  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

////////////////////Login with Facebook///////////////////////
  // ignore: unused_element
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken.toString());

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }
}
