import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  TextEditingController titleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();

  CollectionReference postReference=FirebaseFirestore.instance.collection("post");
 // CollectionReference commentsReference=FirebaseFirestore.instance.collection("post").doc("1nLbxQfCLravxe16EOXJ").collection("comments");
  // add data to firestore
  void addPostToFirestore(String titleText,String bodyText)async{

    User? currentUser=FirebaseAuth.instance.currentUser;
    String uid="";
    if(currentUser!=null){

      uid=currentUser.uid;
    }

    //Map<String,dynamic> data={"title":titleText,"body":bodyText,"uid":uid};
    PostModel detail=PostModel(uid: uid,title: titleText,body:bodyText,id: "0" );
    postReference.add(detail.toJsonWithoutId()).then((value)
    => print("Siccessfully add to firestore")).onError((error, stackTrace) => print("Error: "));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Add Post"),centerTitle: true,),

      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          TextFormField(controller: titleController,
          decoration: InputDecoration(
            hintText: "Title",
              border: OutlineInputBorder()
          ),
          ),
          const SizedBox(height: 20,),
          TextFormField(controller: bodyController,
            maxLines: 6,
            decoration: InputDecoration(
                hintText: "body",
              border: OutlineInputBorder()
            ),
          ),
          TextButton(onPressed: (){
            addPostToFirestore(titleController.text, bodyController.text);
          }, child: Text("Add post"))
        ],
      ),
    );
  }
}
