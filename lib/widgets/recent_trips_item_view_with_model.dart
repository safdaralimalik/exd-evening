import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:week_3/models/trips_model.dart';
class RecentTripsItemViewWithModel extends StatelessWidget {
  final TripsModel detail;
  const RecentTripsItemViewWithModel({Key? key,required this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(children: [
        Container(
          width: 100,
          height: 100,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.2),child: Image.asset(detail.image,fit: BoxFit.cover,)),
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(detail.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10,),
              Text(detail.dateTime)
            ],
          ),
        ),
        const SizedBox(width: 8,),
        Text("-\$${detail.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

      ],),
    );
  }
}
