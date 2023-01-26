
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../db/firestore_db.dart';

class Auth {
  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("user");

  static Future<bool> signupUser(
      {required String email,
      required String password,
      required String fullName,
      required String phoneNumber}) async {
    bool status = false;
    String? token=await FirebaseMessaging.instance.getToken();
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      User? currentUser = credential.user;

      if (currentUser != null) {
        Map<String, dynamic> userProfileData = {
          "name": fullName,
          "phone": phoneNumber,
          "email": email,
          "uid": currentUser.uid
        };

        await FirestoreDB.addUserProfile(data: userProfileData,uid: currentUser.uid);
        DocumentReference userRef=FirebaseFirestore.instance.collection("users").doc(currentUser.uid??"");
        await userRef.update({"firebaseToken":token});



      }


      status = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return status;
  }

  static Future<bool> loginUser(
      {required String email,
        required String password,}) async {
    bool status = false;
    String? token=await FirebaseMessaging.instance.getToken();
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      User? currentUser = credential.user;

      DocumentReference userRef=FirebaseFirestore.instance.collection("users").doc(currentUser?.uid??"");

      await userRef.update({"firebaseToken":token});





      status = true;
    } on FirebaseAuthException catch (e) {
      

    } catch (e) {
      print(e);
    }
    return status;
  }



}
