import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_app/models/post_model.dart';
import 'package:flutter/material.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel detail;

  const PostDetailScreen({Key? key, required this.detail}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  TextEditingController commentController = TextEditingController();
  CollectionReference commentReference =
      FirebaseFirestore.instance.collection("comments");
  late CollectionReference commentReferenceDeep;

  getAllCommentsofPost(){
    commentReference
        .where('postId', isEqualTo: widget.detail.id)
        .get();
  }

  Future<bool> addCommentToPost() async {
    Map<String, dynamic> commentData = {
      "postId": widget.detail.id,
      "text": commentController.text
    };
    bool status = false;
    commentReference.add(commentData).then((value) {
      status = true;
    }).onError((error, stackTrace) {
      status = false;
    });
    return status;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentReferenceDeep = FirebaseFirestore.instance
        .collection("post")
        .doc(widget.detail.id)
        .collection("comments");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          ListTile(
            title: Text("${widget.detail.title}"),
            subtitle: Text("${widget.detail.body}"),
          ),
          TextFormField(
            controller: commentController,
            decoration: InputDecoration(hintText: "type comment"),
          ),
          TextButton(
              onPressed: () async {
                bool status = await addCommentToPost();
                print("status: $status");
                if (status) {
                  print("posted");
                } else {
                  print("error");
                }
              },
              child: Text("Add comment"))
        ],
      ),
    );
  }
}
