import 'package:cloud_firestore/cloud_firestore.dart';

class PostModelNew {
  late final String id;
  late final String postText;
  late final String uid;
  late final String userImage;
  late final String postImage;
  late final String dateTime;
  late final int likesCount;
  late final int commentsCount;
  // default constructor
  PostModelNew({
    required this.uid,
    required this.id,
    required this.postText,
    required this.userImage,
    required this.postImage,
    required this.dateTime,
    required this.likesCount,
    required this.commentsCount,

  });
  
  // for post creation 
  PostModelNew.withoutId({
    required this.uid,
    required this.postText,
    required this.userImage,
    required this.postImage,
    required this.dateTime,

  });
  // when we read data from firebase this will be used for converting DocumentSnapshot to model object
  PostModelNew.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}){
    id=documentSnapshot.id;
    uid=documentSnapshot['uid']??"";
    postText=documentSnapshot["postText"];
    postImage=documentSnapshot["postImage"]??"";
    userImage=documentSnapshot["userImage"];
    likesCount=documentSnapshot["likesCount"]??0;
    commentsCount=documentSnapshot["commentsCount"]??0;
    dateTime=documentSnapshot["dateTime"]??DateTime.now().toString();
  }

  // this will be used to convert PostModelNew.withoutId to Map<String,dynamic>
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['postText'] = postText;
    data['postImage'] = postImage;
    data['userImage'] = userImage;
    data['dateTime'] = dateTime;
    return data;
  }

}


var user={
  "id":0,
  "name":"adsad",
  "email":"wfsdfdfds",
  "uid":"asdsad",
  "dob":"dsad",
  "gender":"cscs",
  "education":"dsadsd",
  "profileImageUrl":"Adsafs",
  "coverImageUrl":"assfs",
  "date_create":"adasa",
  "date_update":"adasa",
  "phoneNumber":"adasa",
  "lat":"adasa",
  "lng":"adasa",
  "address":"adasa",

};