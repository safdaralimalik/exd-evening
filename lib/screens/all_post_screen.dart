import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllPostScreen extends StatefulWidget {
  const AllPostScreen({Key? key}) : super(key: key);

  @override
  State<AllPostScreen> createState() => _AllPostScreenState();
}

class _AllPostScreenState extends State<AllPostScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('post');
    return Scaffold(
      appBar: AppBar(
        title: Text("All Posts"),
        actions: [
          TextButton(onPressed: (){}, child: Text("Add"))
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: posts.get(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            print("snapshot.data!.docs");
            print(snapshot.data!.docs);
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
              return Text("Full Name: ${snapshot.data!.docs[index]['title']} ${snapshot.data!.docs[index]['body']}");
            });
          }

          return Text("loading");
        },
      ),
    );
  }
}
