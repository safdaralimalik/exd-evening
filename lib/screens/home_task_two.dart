import 'package:flutter/material.dart';
import 'package:week_3/widgets/recent_trips_item_view.dart';

class HomeTaskTwo extends StatelessWidget {
  const HomeTaskTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Task Two"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(25),
          itemBuilder: (BuildContext context,int  index){
        return RecentTripsItemView(
          imagePath:index.isEven?"assets/pngs/Boy.png": "assets/pngs/girl.png",
          dateTime: "Dec 20, 2022 : 3:09:AM",
          name: "Startbuc coffee",
          price: "230",
        );
      })
    );
  }
}

