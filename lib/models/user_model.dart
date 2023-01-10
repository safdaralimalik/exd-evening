import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelFireBase {
  UserModelFireBase({
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.password,
    required this.id,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String profileImageUrl;
  late final String password;
  late final String uid;

  UserModelFireBase.fromJson(Map<String, dynamic> json, String id) {
    name = json['name'];
    email = json['email'];
    profileImageUrl = json['profileImageUrl'];
    password = json['password'];
    id = json['id'] ?? "";
    uid = json['uid'];
  }

  UserModelFireBase.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    name = documentSnapshot['name'];
    email = documentSnapshot['email'];
    profileImageUrl = documentSnapshot['profileImageUrl'];
    id = documentSnapshot.id;
    uid = documentSnapshot['uid'];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['profileImageUrl'] = profileImageUrl;
    _data['password'] = password;
    _data['uid'] = uid;
    return _data;
  }
}
