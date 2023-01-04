import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String hintEmail = "Pleas type your email";
  final String hintPassword = "Pleas type your password";

  File? imageFile;
  String imageUpdateKey="imageUpdatekey";

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "enter your email";
    }
    if (!GetUtils.isEmail(value)) {
      return "enter valid email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "enter your password";
    }
    if (value.length < 6) {
      return "enter valid password";
    }
    return null;
  }

  onLoginPressed() {
    Get.snackbar("Login Status", "Successfully Logged in",
        backgroundColor: Colors.pink, colorText: Colors.white);
    Get.defaultDialog(title: "Status", content: Text("Successfully Logged in"));
  }

  pickUserProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imageFile = File(image.path);
      print("image.path: ${image.path}");
      update([imageUpdateKey]);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
