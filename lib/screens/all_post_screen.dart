import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_app/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({Key? key}) : super(key: key);

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference postReference = FirebaseFirestore.instance.collection('post');

    Future<List<PostModel>> getPostListFromFirestore()async{
      List<PostModel> postList=[];
      // var q=await postReference.get();
      // for (var doc in q.docs) {
      //   Map<String,dynamic> docData=doc.data() as Map<String,dynamic>;
      //   postList.add(PostModel.fromJson(docData, doc.id));
      // }
      postReference
          .get()
          .then((QuerySnapshot querySnapshot) {

        for (var doc in querySnapshot.docs) {
          Map<String,dynamic> docData=doc.data() as Map<String,dynamic>;
          postList.add(PostModel.fromJson(docData, doc.id));
        }
        print("postList.length");
        print(postList.length);

      }).onError((error, stackTrace){
        print("$error");

      });
      print("postList.length");
      print(postList.length);
      setState(() {

      });
      return postList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("All Posts"),
        actions: [
          TextButton(onPressed: (){}, child: Text("Add"))
        ],
      ),
      body: FutureBuilder<List<PostModel>>(
        future: getPostListFromFirestore(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text("Error"),);
          }
          if(snapshot.hasData){
            print("snapshot.data!.length");
            print(snapshot.data!.length);
            return snapshot.data!.isEmpty?Center(child: Text("Empty"),):ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){

              PostModel detail=snapshot.data![index];
              return ListTile(
                title:Text(detail.title,style: TextStyle(color: Colors.black),) ,
                subtitle: Text(detail.body),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostDetailScreen(detail: detail)));
                },
              );
            });
          }
          return Center(child: CircularProgressIndicator(),);
        },
      )
    );
  }
}
