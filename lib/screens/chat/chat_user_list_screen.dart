import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_app/models/user_model.dart';
import 'package:firestore_app/screens/chat_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';

import '../../controllers/users_list_controller.dart';

class ChatUserListScreen extends StatefulWidget {
  const ChatUserListScreen({Key? key}) : super(key: key);

  @override
  State<ChatUserListScreen> createState() => _ChatUserListScreenState();
}

class _ChatUserListScreenState extends State<ChatUserListScreen> {
  CollectionReference userReference = FirebaseFirestore.instance.collection('user');
 late Future<List<UserModel>> usersFuture;
  Future<List<UserModel>> getusersListFromFirestore()async{
    List<UserModel> usersList=[];
    // var q=await userReference.get();
    // for (var doc in q.docs) {
    //   Map<String,dynamic> docData=doc.data() as Map<String,dynamic>;
    //   usersList.add(PostModel.fromJson(docData, doc.id));
    // }
    userReference
        .get()
        .then((QuerySnapshot querySnapshot) {

      for (var doc in querySnapshot.docs) {
        Map<String,dynamic> docData=doc.data() as Map<String,dynamic>;
        usersList.add(UserModel.fromJson(docData, doc.id));
      }
      print("usersList.length");
      print(usersList.length);

    }).onError((error, stackTrace){
      print("$error");

    });
    print("usersList.length");
    print(usersList.length);
    //await Future.delayed(Duration.zero);
    // setState(() {
    //
    // });
    return usersList;
  }
  UserListController controller=Get.put(UserListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersFuture=getusersListFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All Posts"),
          actions: [
            TextButton(onPressed: (){}, child: Text("Add"))
          ],
        ),
        body: FutureBuilder<List<UserModel>>(
          future: usersFuture,
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

                    UserModel detail=snapshot.data![index];
                    return ListTile(

                      title:Text(detail.name,style: TextStyle(color: Colors.black),) ,
                      subtitle: Text(detail.email),
                      onTap: (){

                        final _user =  types.User(
                          id: detail.uid,
                          firstName:detail.name,
                          imageUrl: detail.profileImageUrl,
                        );
                        controller.currentOtherUser=types.User(
                          id: detail.uid,
                          firstName:detail.name,
                          imageUrl: detail.profileImageUrl,
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {

                        return ChatPage(
                          receiverUser: _user,
                        );

                      }));
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
