import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:local_storage_app/main.dart';
import 'package:local_storage_app/models/post_model.dart';
import 'package:local_storage_app/models/user_model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 Future<List<UserModel>> getUsersList()async{
   List<UserModel> list=[];
   Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/users");
   http.Response response=await http.get(uri);
   if(response.statusCode==200){
     var decodedBody=jsonDecode(response.body);
     list=List<UserModel>.from(decodedBody.map((json)=>UserModel.fromJson(json))).toList();
   }
   return list;
 }
 Future<List<PostModel>> getPostList()async{
   List<PostModel> list=[];

   if(objectBox.getPostModelCount()>=1){
     print("Data from Object Box");
     return objectBox.getAllPostModel();
   }else{
     Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts");
     http.Response response=await http.get(uri);
     if(response.statusCode==200){
       var decodedBody=jsonDecode(response.body);
       list=List<PostModel>.from(decodedBody.map((json)=>PostModel.fromJson(json))).toList();
     }
     objectBox.insertAllPostModel(list);
     print("Data from API");
     return list;
   }

 }

 // only run if you made changed in model
//flutter pub run build_runner build --delete-conflicting-outputs
// run when you add object box first time in the app
//flutter pub run build_runner build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),
      actions: [
        TextButton(onPressed: (){

          PostModel detail= PostModel.autoId(
              userId: 1,
              title: "title",
              body: "body");
          objectBox.insertPostModel(detail);



        }, child: Text("Add Post",style: TextStyle(color: Colors.white),)),
        TextButton(onPressed: (){
     objectBox.clearAllDB();
          setState(() {

          });
        }, child: Text("Clear",style: TextStyle(color: Colors.white),))
      ],),
      body:

      ListView(
        children: [
          // FutureBuilder<List<PostModel>>(
          //   future: getPostList(),
          //   builder: (BuildContext context,AsyncSnapshot<List<PostModel>> snapshot){
          //     if(snapshot.hasData){
          //       return ListView.builder(
          //         shrinkWrap: true,
          //           physics: ScrollPhysics(),
          //           itemCount: snapshot.data!.length,
          //           itemBuilder: (context,index){
          //             PostModel detail=snapshot.data![index];
          //         return ListTile(
          //           title: Text(detail.title),
          //           subtitle: Text(detail.body),
          //         );
          //       });
          //     }
          //     return const Center(child: CupertinoActivityIndicator(),);
          //   },
          // ),

          StreamBuilder<List<PostModel>>(
            stream: objectBox.getAllPostOfListStream(),
            builder: (context, snapshot){
              if(snapshot.connectionState==ConnectionState.active){
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      PostModel detail=snapshot.data![index];
                      return ListTile(
                        title: Text(detail.title),
                        subtitle: Text(detail.body),
                      );
                    });
              }
              return const Center(child: CupertinoActivityIndicator(),);
            },
          ),


        ],
      ),


    );
  }
}
