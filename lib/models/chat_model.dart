import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  ChatModel({
    required this.chatText,
    required this.dateTime,
    required this.imageUrl,
    required this.status,
    required this.senderUser,
    required this.receiverUser,
  });
  late final String chatId;
  late final String chatText;
  late final String dateTime;
  late final String imageUrl;
  late final int status;
  late final ChatUser senderUser;
  late final ChatUser receiverUser;

  ChatModel.fromDocumentSnapshot({required DocumentSnapshot snapshot}){
    chatId=snapshot.id;
    chatText = snapshot['chatText'];
    dateTime = snapshot['dateTime'];
    imageUrl = snapshot['imageUrl'];
    status = snapshot['status'];
    senderUser = ChatUser.fromJson(snapshot['senderUser']);
    receiverUser = ChatUser.fromJson(snapshot['receiverUser']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chatText'] = chatText;
    _data['dateTime'] = dateTime;
    _data['imageUrl'] = imageUrl;
    _data['status'] = status;
    _data['senderUser'] = senderUser.toJson();
    _data['receiverUser'] = receiverUser.toJson();
    return _data;
  }
}

class ChatUser {
  ChatUser({
    required this.email,
    required this.uid,
    required this.name,
    required this.userImageUrl,
  });
  late final String email;
  late final String uid;
  late final String name;
  late final String userImageUrl;

  ChatUser.fromJson(Map<String, dynamic> json){
    email = json['email'];
    uid = json['uid'];
    name = json['name'];
    userImageUrl = json['userImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['uid'] = uid;
    _data['name'] = name;
    _data['userImageUrl'] = userImageUrl;
    return _data;
  }
}
