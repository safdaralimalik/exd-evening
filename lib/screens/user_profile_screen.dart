import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/image_controller.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //////////////////////App Bar ///////////////////////////
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("User Profile Screen"),
          centerTitle: true,
          elevation: 0,
        ),
        body: GetBuilder<ImageController>(
            init: ImageController(),
            builder: (_) {
              return Column(children: [
                GetBuilder<ImageController>(
                    /////////profileimagescreen///////////////
                    id: _.imageUpdateKey,
                    builder: (_) {
                      return _.imageFile != null
                          ? Stack(
                              clipBehavior: Clip.none,
                              children: [
                                //////coverimagescreen/////////////
                                GetBuilder<ImageController>(
                                  id: _.imageUpdateKeyTwo,
                                  builder: (logic) {
                                    return logic.coverFile != null
                                        ? GestureDetector(
                                            onTap: () {
                                              logic.pickUserCoverImage(context);
                                              logic
                                                  .uploadCoverImagetoFirebasestorage(
                                                      context);
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 30),
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.grey,
                                              child: ClipRRect(
                                                child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200,
                                                    child: Image.file(
                                                      logic.coverFile!,
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    logic.pickUserCoverImage(
                                                        context);
                                                    logic
                                                        .uploadCoverImagetoFirebasestorage(
                                                            context);
                                                  },
                                                  child: Container(
                                                    height: 230,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    color: Colors.grey,
                                                    child: const Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 50,
                                                      color: Colors.black,
                                                    ),
                                                  )),
                                            ],
                                          );
                                  },
                                ),
                                //////////////////////User Profile image ///////////////////////////
                                Positioned(
                                  top: 170,
                                  left: MediaQuery.of(context).size.width / 2 -
                                      50,
                                  child: GestureDetector(
                                    onTap: () {
                                      _.pickUserProfileImage(context);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Image.file(
                                            _.imageFile!,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  top: 170,
                                  left: 220,
                                  child: IconButton(
                                      onPressed: () async {
                                        await _.pickUserProfileImage(context);
                                      },
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                ),
                              ],
                            )
                          : Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      _.pickUserProfileImage(context);
                                      _.uploadImagetoFirebasestorage(context);
                                    },
                                    child: Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey,
                                      child: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 50,
                                        color: Colors.black,
                                      ),
                                    )),
                                Positioned(
                                  left: 150,
                                  top: 150,
                                  child: GestureDetector(
                                    onTap: () {
                                      _.pickUserProfileImage(context);
                                      _.uploadImagetoFirebasestorage(context);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image(
                                            image: AssetImage(
                                                "assets/images/profileimage.jpg")),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                    }),
              ]);
            }));
  }
}
