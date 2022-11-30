import 'package:flutter/material.dart';

import 'home_screen.dart';

class MyTabViewScreen extends StatefulWidget {
  const MyTabViewScreen({Key? key}) : super(key: key);

  @override
  State<MyTabViewScreen> createState() => _MyTabViewScreenState();
}

class _MyTabViewScreenState extends State<MyTabViewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Default TabBar Example"),
            bottom:  TabBar(
              tabs: [
                Tab(
                   text: "Tab1",
                  // icon: Icon(Icons.local_airport),
                   //child: Row(children: [Text("Tab1"),Icon(Icons.local_airport)],),
                ),
                Tab(
                  text: "Tab2",
                ),
                Tab(
                  text: "Tab3",
                )
              ],
            ),
          ),
          body:const TabBarView(
            children: [
              HomeScreen(),
              Center(
                child: Text("TabBarView2"),
              ),
              Center(
                child: Text("TabBarView3"),
              )
            ],
          ),
        ));
  }
}
