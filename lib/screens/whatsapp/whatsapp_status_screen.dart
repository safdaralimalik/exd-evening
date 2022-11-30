import 'package:flutter/material.dart';

class WhatsAppStatusScreen extends StatefulWidget {
  const WhatsAppStatusScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppStatusScreen> createState() => _WhatsAppStatusScreenState();
}

class _WhatsAppStatusScreenState extends State<WhatsAppStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.add,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "My Status",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Tap to add status update",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                  ),
                  title: Text("name"),
                  subtitle: Text("Last Update 9:00 pm"),
                );
              })
        ],
      ),
    );
  }
}
