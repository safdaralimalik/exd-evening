import 'package:flutter/material.dart';
class DrawerTestScreen extends StatefulWidget {
  const DrawerTestScreen({Key? key}) : super(key: key);

  @override
  State<DrawerTestScreen> createState() => _DrawerTestScreenState();
}
class _DrawerTestScreenState extends State<DrawerTestScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey();

  List<String> myList=List.generate(100, (index) => "index$index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(

        leading: IconButton(icon: Icon(Icons.access_alarm),onPressed: (){
          if(_scaffoldKey.currentState!=null){
            _scaffoldKey.currentState!.openDrawer();
          }
        },),
      ),
      endDrawer: Drawer(),
      drawer: Drawer(
         backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            UserAccountsDrawerHeader(

              accountName: Text("name"),
              accountEmail: Text("email"),
              currentAccountPicture: Container(color: Colors.pink,),
              otherAccountsPictures: [
                Container(color: Colors.amber,),
                Container(color: Colors.green,),
              ],

            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: (){},
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: (){},
            ),
            ListTile(
              title: Text("Close"),
              leading: Icon(Icons.close_sharp),
              onTap: (){
                Navigator.of(context).pop();
              },
            )


          ],
        ),
      ),
      body: GridView.count(
        // primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: List.generate(myList.length, (index) => Container(

          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child:  Text(myList[index]),
        )),
      ),
    );
  }
}
