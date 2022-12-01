import 'package:flutter/material.dart';
class BottomNevHomeScreen extends StatefulWidget {
  const BottomNevHomeScreen({Key? key}) : super(key: key);

  @override
  State<BottomNevHomeScreen> createState() => _BottomNevHomeScreenState();
}
class _BottomNevHomeScreenState extends State<BottomNevHomeScreen> {
 int _selectedIndex=1;
 List<Widget> bodyList=[
   Center(child: Text("Index==0"),),
   Center(child: Text("Index==1"),),
   Center(child: Text("Index==2"),),
   Center(child: Text("Index==3"),),
 ];
 void _onNevBarTapped(int currentIndex){
   _selectedIndex=currentIndex;
   setState(() {

   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nev Bar Example"),),
      body: bodyList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
      items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Star"),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_outlined),label: "Unit"),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm),label: "Alarm")
        ],
      currentIndex: _selectedIndex,

      onTap: _onNevBarTapped,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,

      ),
    );
  }
}
