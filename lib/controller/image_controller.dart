import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  ////////////////////////Variable for Image///////////////////////////
  File? imageFile;
  File? coverFile;
  String imageUpdateKey = "imageUpdatekey";
  String imageUpdateKeyTwo = "imageUpdatekeyTwo";

  ///////////// Profile Image Method//////////////////////////

  pickUserProfileImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
      if (croppedFile != null) {
        imageFile = File(croppedFile.path);
        debugPrint("image.path: ${image.path}");
        update([imageUpdateKey]);
        // ignore: use_build_context_synchronously
        uploadImagetoFirebasestorage(context);
      }
    }
  }
  ///////////////////Cover Image Method////////////////////////////

  pickUserCoverImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );
      if (croppedFile != null) {
        coverFile = File(croppedFile.path);
        debugPrint("image.path: ${image.path}");
        update([imageUpdateKeyTwo]);

        // ignore: use_build_context_synchronously
        uploadCoverImagetoFirebasestorage(context);
      }
    }
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  ///////////////////////////////Upload image to a firebase////////////////////////
  Future uploadImagetoFirebasestorage(BuildContext context) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      final storageRef = FirebaseStorage.instance
          .ref()
          .child("UsersProfilePhoto/")
          .child("/$fileName");

      await storageRef.putFile(imageFile!);

      /////////////////////////////////Send image url to fireStore////////////////
      String imageUrl = await storageRef.getDownloadURL();
      User? user = FirebaseAuth.instance.currentUser;

      CollectionReference usersReference =
          FirebaseFirestore.instance.collection("users");
      String uid = "";
      debugPrint("uid:$uid");
      if (user != null) {
        uid = user.uid;
      }
      debugPrint("uid:$uid");
      try {
        DocumentReference currentUserReference = usersReference.doc(uid);
        await currentUserReference.update({"profileImageUrl": imageUrl});
        return true;
      } on Exception catch (e) {
        debugPrint(e.toString());
        return false;
      }
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }

  ///////////////////////////////Upload Coverimage to a firebase////////////////////////
  Future uploadCoverImagetoFirebasestorage(BuildContext context) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();

      final storageRef = FirebaseStorage.instance
          .ref()
          .child("UsersProfileCoverPhoto/")
          .child("/$fileName");

      await storageRef.putFile(coverFile!);
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }
}
////////////////////////////send image into the sperate collection/////////////////////
    // CollectionReference imageReference =
      //     FirebaseFirestore.instance.collection("images");
         // Map<String, dynamic> data = {
      //   "uid": uid,
      //   "imageurl": imageUrl,
      // };

      // debugPrint(data.toString());
      // imageReference
      //     .add(data)
      //     .then((value) => debugPrint("Successfully add to firestore"))
      //     .onError((error, stackTrace) => debugPrint('Error'));