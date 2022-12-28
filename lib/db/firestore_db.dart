import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB{

  CollectionReference postReference=FirebaseFirestore.instance.collection("post");
  CollectionReference commentsReference=FirebaseFirestore.instance.collection("comments");

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();



}