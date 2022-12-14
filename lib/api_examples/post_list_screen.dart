import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week_3/models/post_model.dart';
class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
List<PostModel> postList=[];
 Future<List<PostModel>> getPosts()async{
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response=await http.get(uri);
    var decodedBody=jsonDecode(response.body) as List;
    for(int i=0;i<decodedBody.length;i++){
      postList.add(PostModel.fromJson(decodedBody[i]));
    }
    //setState(() {});
    //var list=List<PostModel>.from(decodedBody.map((i)=>PostModel.fromJson(i))).toList();
    return postList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var resPosts=getPosts();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:postList.isEmpty?Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context,index){
        return ListTile(title: Text(postList[index].title),
        subtitle: Text(postList[index].body),);
      }),
    );
  }
}
