import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week_3/models/post_model.dart';

import '../screens/user_profile_screen.dart';
class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {

  Future<List<PostModel>> getPosts()async{
    List<PostModel> postList=[];
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response=await http.get(uri);
    var decodedBody=jsonDecode(response.body) as List;
    // for(int i=0;i<decodedBody.length;i++){
    //   postList.add(PostModel.fromJson(decodedBody[i]));
    // }

    postList=List<PostModel>.from(decodedBody.map((json)=>PostModel.fromJson(json))).toList();
    return postList;
  }
  Future<List<PostModel>> getPostsOfUser()async{
    List<PostModel> postList=[];
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts?userId=${detail.id}");
    http.Response response=await http.get(uri);
    var decodedBody=jsonDecode(response.body) as List;
    // for(int i=0;i<decodedBody.length;i++){
    //   postList.add(PostModel.fromJson(decodedBody[i]));
    // }

    postList=List<PostModel>.from(decodedBody.map((json)=>PostModel.fromJson(json))).toList();
    return postList;
  }
  bool isLoading=false;
  Future<bool> addPostsOfUser()async{
    setState(() {isLoading=true;});
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts");
    Map<String,dynamic> body= {
      "userId":1,
      "title":"ffffsff",
      "body":"dwadasfsafs"
    };
    Map<String,String> header={"Content-Type":"application/json; charset=UTF-8"};
    http.Response response=await http.post(uri,body:jsonEncode(body),headers:header);
    setState(() {
      isLoading=false;
    });
    if(response.statusCode==201){
      return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
        body:FutureBuilder<List<PostModel>>(
          future: getPosts(),
          builder: (BuildContext context,AsyncSnapshot<List<PostModel>> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index){
                    PostModel? detail=snapshot.data![index];
                    return isLoading?CircularProgressIndicator(): ListTile(
                      title: Text(detail.title),
                      subtitle: Text(detail.body),
                      onTap: ()async{
                        bool status=await addPostsOfUser();
                        if(status){
                          // snackbar
                          //Success
                        }else{
                          // failiar
                        }
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserProfileScreen(detail: detail)));
                      },
                    );
                  });
            }else if(snapshot.hasError){
              return Center(child: Text("${snapshot.error}"));
            }
            else {
              return const Center(child: CircularProgressIndicator(),);
            }
          },

        )
    );
  }
}
