import 'package:flutter/material.dart';
import 'package:week_3/models/user_model.dart';
class UserProfileScreen extends StatefulWidget {
  final UserModel detail;
  const UserProfileScreen({Key? key, required this.detail}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.detail.address.geo.lng),
    );
  }
}
