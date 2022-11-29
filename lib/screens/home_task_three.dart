import 'package:flutter/material.dart';
import 'package:week_3/models/trips_model.dart';
import 'package:week_3/widgets/recent_trips_item_view.dart';
import 'package:week_3/widgets/recent_trips_item_view_with_model.dart';

class HomeTaskThree extends StatelessWidget {
   HomeTaskThree({Key? key}) : super(key: key);

   List<String> sList=["wetwe","rfwfwef"];
  List<TripsModel> tripsList=[
    TripsModel(
      image:"assets/pngs/girl.png",
      name: "Startbuc coffee1",
      dateTime: "Dec 20, 2022 : 3:09:AM",
      price: "100"),
    TripsModel(
        image:"assets/pngs/Boy.png",
        name: "Startbuc coffee2",
        dateTime: "Dec 30, 2022 : 4:09:AM",
        price: "100"),
    TripsModel(
        image:"assets/pngs/food.png",
        name: "Startbuc coffee3",
        dateTime: "Jan 30, 2022 : 5:09:AM",
        price: "150"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Task Three"),
      ),
      body: ListView.builder(
        itemCount: tripsList.length,//3
        padding: EdgeInsets.all(25),
          itemBuilder: (BuildContext context,int  index){
          TripsModel detail=tripsList[index];//index=0,1,2
       return RecentTripsItemViewWithModel(detail: detail);
      })
    );
  }
}

