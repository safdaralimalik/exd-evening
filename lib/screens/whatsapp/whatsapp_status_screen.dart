import 'package:flutter/material.dart';

class WhatsAppStatusScreen extends StatefulWidget {
  const WhatsAppStatusScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppStatusScreen> createState() => _WhatsAppStatusScreenState();
}

class _WhatsAppStatusScreenState extends State<WhatsAppStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Text("status");
    });
  }
}
