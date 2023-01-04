import 'package:flutter/material.dart';
import 'package:fluttter_getx_app/controllers/home_screen_controller.dart';
import 'package:fluttter_getx_app/screens/screen_two.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Getx Counter"),
          leading: IconButton(icon: Text("next"),onPressed: (){
            Get.to(ScreenTwo());
          },),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Obx(() =>
                  Text(
                    '${controller.count}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  ),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.count.value= controller.count.value+1;
            print("obx called");
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}
