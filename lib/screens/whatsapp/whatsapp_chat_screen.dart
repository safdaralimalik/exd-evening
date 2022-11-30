import 'package:flutter/material.dart';

class WhatsAppChatScreen extends StatefulWidget {
  const WhatsAppChatScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppChatScreen> createState() => _WhatsAppChatScreenState();
}

class _WhatsAppChatScreenState extends State<WhatsAppChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return ListTile(title: Text("name"),subtitle: Text("last message"),);
    });
  }
}
