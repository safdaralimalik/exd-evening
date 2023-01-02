import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB{

 static CollectionReference postReference=FirebaseFirestore.instance.collection("posts");
 static CollectionReference commentsReference=FirebaseFirestore.instance.collection("comments");
 static CollectionReference userReference=FirebaseFirestore.instance.collection("users");


static Future<bool> addUserProfiler({required Map<String, dynamic> data, required String uid})async{

    try {
      DocumentReference currentUserReference =
      userReference.doc(uid);
      await currentUserReference.set(data);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }


}