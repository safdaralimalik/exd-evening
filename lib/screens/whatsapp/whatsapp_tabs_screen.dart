import 'package:flutter/material.dart';
import 'package:week_3/screens/whatsapp/whatsapp_calls_screen.dart';
import 'package:week_3/screens/whatsapp/whatsapp_chat_screen.dart';
import 'package:week_3/screens/whatsapp/whatsapp_status_screen.dart';
class WhatsAppTabsScreen extends StatefulWidget {
  const WhatsAppTabsScreen({Key? key}) : super(key: key);
  @override
  State<WhatsAppTabsScreen> createState() => _WhatsAppTabsScreenState();
}
class _WhatsAppTabsScreenState extends State<WhatsAppTabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Default TabBar Example"),
            bottom:const  TabBar(
              tabs: [
                Tab(
                  text: "Chat",
                  // icon: Icon(Icons.local_airport),
                  //child: Row(children: [Text("Tab1"),Icon(Icons.local_airport)],),
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Calls",
                )
              ],
            ),
          ),
          body:const TabBarView(
            children: [
              WhatsAppChatScreen(),
              WhatsAppStatusScreen(),
              WhatsAppCallsScreen()
            ],
          ),
        ));
  }
}
