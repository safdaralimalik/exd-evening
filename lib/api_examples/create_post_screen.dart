import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreatePostScreen extends StatefulWidget {
  final int id;
  const CreatePostScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}
class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController bodyController=TextEditingController();
  bool isLoading=false;
  Future<bool> addPostsOfUser()async{
    setState(() {isLoading=true;});
    Uri uri=Uri.parse("https://jsonplaceholder.typicode.com/posts");
    Map<String,dynamic> body= {
      "userId":widget.id,
      "title":titleController.text,
      "body":bodyController.text
    };
    print(body);
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
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
            ),
            TextFormField(
              controller: bodyController,
            ),
            TextButton(onPressed: ()async{
              if(formKey.currentState!.validate()){
                bool status=await addPostsOfUser();
                var snackBar = SnackBar(
                  content: Text(status?"Success":'Error'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.of(context).pop();
              }


            }, child: Text("send"))
          ],
        ),
      ),
    );
  }
}
