import 'package:flutter/material.dart';
import 'package:week_3/screens/whatsapp/whatsapp_chat_screen.dart';
class BottomNevHomeScreen extends StatefulWidget {
  const BottomNevHomeScreen({Key? key}) : super(key: key);

  @override
  State<BottomNevHomeScreen> createState() => _BottomNevHomeScreenState();
}
class _BottomNevHomeScreenState extends State<BottomNevHomeScreen> {
 int _currentIndex=1;
 List<Widget> bodyList=[
   WhatsAppChatScreen(),
   Center(child: Text("Index==1"),),
   Center(child: Text("Index==2"),),
   Center(child: Text("Index==3"),),
 ];
 void _onNevBarTapped(int tappedIndex){

   _currentIndex=tappedIndex;
   setState(() {

   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nev Bar Example"),),
      body: bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
      items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Star"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined),label: "Unit"),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Alarm")
        ],
      currentIndex: _currentIndex,

      onTap: _onNevBarTapped,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,

      ),
    );
  }
}
