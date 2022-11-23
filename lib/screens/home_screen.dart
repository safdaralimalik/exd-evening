import 'package:flutter/material.dart';
import 'package:week_3/screens/value_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int count=0;

  void increment(){
    count=count+1;
    setState(() {
    });
  }

  void decrement(){
    --count;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("Home Screen",style: TextStyle(fontSize: 16,color: Colors.black),),
      ),
      body: Column(
        children: [
          Text("Counter Value: $count",style: TextStyle(fontSize: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 50,
              onPressed: (){
                increment();
                },
              icon: Icon(Icons.add_circle,color: Colors.green,)),

             IconButton(
                 iconSize: 50,
                 onPressed: decrement, icon: Icon(Icons.remove_circle,color: Colors.red,))

            ],
          ),

          TextButton(onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (context){

              return ValueScreen(counterValue: count);
            }));
          }, child: Text("Navigate"))
        ],
      )
    );
  }
}

