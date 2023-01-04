import 'package:flutter/material.dart';
import 'package:fluttter_getx_app/controllers/home_screen_controller.dart';
import 'package:get/get.dart';
class ScreenTwo extends StatelessWidget {
   ScreenTwo({Key? key}) : super(key: key);

   HomeScreenController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          child: Text("Back",style: TextStyle(color: Colors.white),),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Center(child: Text("${controller.count}"),),
    );
  }
}
