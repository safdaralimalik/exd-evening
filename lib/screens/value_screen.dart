import 'package:flutter/material.dart';

class ValueScreen extends StatefulWidget {
 final int counterValue;
  const ValueScreen({Key? key,required this.counterValue}) : super(key: key);
  @override
  _ValueScreenState createState() => _ValueScreenState();
}
class _ValueScreenState extends State<ValueScreen> {
  String myValue="";


  void multiplyFun({required int value}){
    myValue="${value*2}";
  }
 @override
  void initState() {
    super.initState();
    multiplyFun(value: widget.counterValue);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Value Screen"),
        backgroundColor: Colors.grey,
        leading: TextButton(onPressed: (){
          Navigator.of(context).pop();
        },child: Text("Back",style: TextStyle(color: Colors.white,fontSize: 16),),),
      ),

      body:Center(child: Text(myValue,style: TextStyle(fontSize: 30,color: Colors.white),),)
    );
  }



}
