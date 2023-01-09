import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDB {
  static CollectionReference postReference =
      FirebaseFirestore.instance.collection("posts");
  static CollectionReference commentsReference =
      FirebaseFirestore.instance.collection("comments");
  static CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");

  static Future<bool> addUserProfile(
      {required Map<String, dynamic> data, required String uid}) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      DocumentReference currentUserReference = userReference.doc(data["uid"]);
      await currentUserReference.set(data);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  static Future<bool> updateProfileImage(
      {required String firebaseImagePath, required String uid}) async {

    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }
    try {
      DocumentReference currentUserReference = userReference.doc(uid);
      await currentUserReference.update({"profileImageUrl":firebaseImagePath});
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  //data={"title":"dasdsa","body":"dasda"};
  static addNewPost(Map<String, dynamic> data) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    data["uid"] = uid;
    //data={"title":"dasdsa","body":"dasda","uid":"qwrdqwwqwqdeqwfdewfew"};
    postReference.add(data);
  }

  //data={"postId":"dasdsa","text":"usr typed text"};
static addNewCommentToPost(Map<String, dynamic> data,) async {
  User? user = FirebaseAuth.instance.currentUser;
  String uid = "";
  if (user != null) {
    uid = user.uid;
  }

  data["uid"] = uid;
  //data={"postId":"dasdsa","text":"usr typed text",uid":"qwrdqwwqwqdeqwfdewfew"};
  postReference.add(data);
}
}