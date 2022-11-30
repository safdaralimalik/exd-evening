import 'package:flutter/material.dart';
class WhatsAppCallsScreen extends StatefulWidget {
  const WhatsAppCallsScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppCallsScreen> createState() => _WhatsAppCallsScreenState();
}

class _WhatsAppCallsScreenState extends State<WhatsAppCallsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Text("calls");
    });
  }
}
