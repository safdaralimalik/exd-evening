import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:week_3/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';
class UserProfileScreen extends StatefulWidget {
  final UserModel detail;
  const UserProfileScreen({Key? key, required this.detail}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  Future<List<PostModel>> getPostsOfUser()async{
    List<PostModel> postList=[];
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=${widget.detail.id}");
    http.Response response=await http.get(uri);
    var decodedBody=jsonDecode(response.body) as List;
    // for(int i=0;i<decodedBody.length;i++){
    //   postList.add(PostModel.fromJson(decodedBody[i]));
    // }

    postList=List<PostModel>.from(decodedBody.map((json)=>PostModel.fromJson(json))).toList();
    return postList;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PostModel>>(
        future: getPostsOfUser(),
        builder: (BuildContext context,AsyncSnapshot<List<PostModel>> snapshot){
          if(snapshot.hasData){
            return ListView.builder(

                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  PostModel? detail=snapshot.data![index];
                  return ListTile(
                    title: Text(detail.title),
                    subtitle: Text(detail.body),

                  );
                });
          }else if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },

      ),
    );
  }
}
