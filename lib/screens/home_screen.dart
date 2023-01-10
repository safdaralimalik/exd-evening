import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference usersReference =
      FirebaseFirestore.instance.collection("users");
  late String userID;
  String getUserID() {
    User? user = FirebaseAuth.instance.currentUser;
    userID = user!.uid;
    return userID;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "User Profile Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: usersReference.where('uid', isEqualTo: userID).get(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              // Map<String, dynamic> data =
              //     snapshot.data!.data() as Map<String, dynamic>
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  UserModelFireBase detail =
                      UserModelFireBase.fromDocumentSnapshot(
                          snapshot.data!.docs[index]);
                  return Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(detail.profileImageUrl.toString()),
                      ),
                      Text(detail.name),
                      Text(detail.email),
                    ],
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
