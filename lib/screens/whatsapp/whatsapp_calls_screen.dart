import 'package:flutter/material.dart';

class WhatsAppCallsScreen extends StatefulWidget {
  const WhatsAppCallsScreen({Key? key}) : super(key: key);

  @override
  State<WhatsAppCallsScreen> createState() => _WhatsAppCallsScreenState();
}

class _WhatsAppCallsScreenState extends State<WhatsAppCallsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 10, right: 10),
          child: Row(
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
                    "Create a  Call link",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Share a link for whatsapp call",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
        ListView.builder(
            physics: const ScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const ListTile(
                leading: CircleAvatar(
                  radius: 35,
                ),
                title: Text("name"),
                subtitle: Text("Today at 5:00 pm"),
                trailing: Icon(
                  Icons.video_call,
                ),
              );
            })
      ],
    );
  }
}
