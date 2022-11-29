import 'package:flutter/material.dart';
class RecentTripsItemView extends StatefulWidget {
  final String imagePath;
  final String name;
  final String dateTime;
  final String price;
  const RecentTripsItemView({Key? key,required this.imagePath,required this.name,required this.dateTime,required this.price}) : super(key: key);

  @override
  State<RecentTripsItemView> createState() => _RecentTripsItemViewState();
}

class _RecentTripsItemViewState extends State<RecentTripsItemView> {
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
          child: Image.asset(widget.imagePath,fit: BoxFit.cover,),
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10,),
              Text(widget.dateTime)
            ],
          ),
        ),
        const SizedBox(width: 8,),
        Text("-\$${widget.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

      ],),
    );
  }
}
