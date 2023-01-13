import 'package:firestore_app/screens/add_post_screen.dart';
import 'package:firestore_app/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/prefs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.9,
        title: Text(Prefs.getUserUID()),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          Get.to(AddPostScreen(),  transition: Transition.downToUp);
        return Container(
          width: Get.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [

                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 50,height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),

                                ),
                                const SizedBox(width: 8,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Name"),
                                    Text("20 min.")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.share,color: Colors.red,))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the "),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              SizedBox(width: Get.width,
             // height: 150,
                child: Image.network("https://uploads-ssl.webflow.com/5f841209f4e71b2d70034471/60bb4a2e143f632da3e56aea_Flutter%20app%20development%20(2).png",
                  fit: BoxFit.fitWidth,),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("12 Likes"),
                        Text("12 Comments"),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.thumb_up_alt_outlined,color: Colors.red,)),
                        Text("12 Comments"),
                      ],
                    ),
                  ],
                ),
              ),




            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return Container(width: Get.width,
        height: 10,
          color: Colors.grey,
        );
      },),
    );
  }
}
