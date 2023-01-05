import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
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

  pickUserProfileImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        // aspectRatioPresets: [
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio16x9
        // ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Profile Image',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Profile Image',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
      if(croppedFile!=null){
        imageFile = File(croppedFile.path);

        print("image.path: ${croppedFile.path}");
        update([imageUpdateKey]);
        uploadImageToFirebaseStorage();
      }

    }
  }

  uploadImageToFirebaseStorage(){

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
