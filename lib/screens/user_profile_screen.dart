import 'package:flutter/material.dart';
import 'package:local_storage_app/main.dart';
import 'package:local_storage_app/models/post_model.dart';
import 'package:local_storage_app/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel detail;
  const ProfileScreen({Key? key,required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [

          Text("Username: ${detail.name}"),
          ListView.builder(
            shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: objectBox.getAllPostsOfUser(detail.id).length,
              itemBuilder: (context,index){

                PostModel detail=objectBox.getAllPostsOfUser(1)[index];
            return ListTile(
              title: Text(detail.title),
              subtitle: Text(detail.body),

            );
          }),
        ],
      ),
    );
  }
}
