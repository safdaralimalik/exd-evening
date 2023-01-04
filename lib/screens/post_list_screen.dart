import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_app/models/post_model.dart';
import 'package:firestore_app/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  CollectionReference postReference =
      FirebaseFirestore.instance.collection("post");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: postReference.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          if (snapshot.hasData) {
            if(snapshot.data!=null){
              return  ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // Map<String,dynamic> doc=snapshot.data!.docs[index].data() as Map<String,dynamic>;
                  // String docId=snapshot.data!.docs[index].id;
                  PostModel detail=PostModel.fromDocumentSnapshot(snapshot: snapshot.data!.docs[index]);
                  return ListTile(
                    title: Text(detail.title),
                    subtitle: Text(detail.body),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostDetailScreen(detail: detail)));
                    },
                  );
                },
              );
            }else{
              return const Center(child: Text("Nothing to show"),);
            }

          }

          return const Center(child: Text("Loading...."),);
        },
      ),
    );
  }
}
