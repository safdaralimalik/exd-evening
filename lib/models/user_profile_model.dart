// var j={
//   "createdAt":"affasfsf",
//   "firstName":"afafasf",
//   "imageUrl":"ffwe",
//   "lastSeen":"adasfa",
//   "updatedAt":"afafaf",
//   "metadata":{
//    "address":"afasfa",
//     "coverImageUrl":"sfsfasd",
//     "dob":"",
//     "gender":"sdv",
//     "lat":"sfsfs",
//     "lng":"asfsaf",
//     "phoneNo":"sfsdfsdfg"
//
//   }
// };

import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  UserProfileModel({
    required this.createdAt,
    required this.firstName,
    required this.imageUrl,
    required this.lastSeen,
    required this.updatedAt,
    required this.metadata,
  });
  late final String createdAt;
  late final String firstName;
  late final String imageUrl;
  late final String lastSeen;
  late final String updatedAt;
  late final Metadata metadata;

  UserProfileModel.fromJson(Map<String, dynamic> json){
    createdAt = json['createdAt']??"";
    firstName = json['firstName']??"";
    imageUrl = json['imageUrl']??"";
    lastSeen = json['lastSeen']??"";
    updatedAt = json['updatedAt']??"";
    metadata = Metadata.fromJson(json['metadata']??{});
  }
  UserProfileModel.fromDocumentSnapshot(DocumentSnapshot snapshot){
    Map<String,dynamic> json=snapshot.data() as Map<String,dynamic>;
    createdAt = json['createdAt']??"";
    firstName = json['firstName']??"";
    imageUrl = json['imageUrl']??"";
    lastSeen = json['lastSeen']??"";
    updatedAt = json['updatedAt']??"";
    metadata = Metadata.fromJson(json['metadata']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['firstName'] = firstName;
    _data['imageUrl'] = imageUrl;
    _data['lastSeen'] = lastSeen;
    _data['updatedAt'] = updatedAt;
    _data['metadata'] = metadata.toJson();
    return _data;
  }
}

class Metadata {
  Metadata({
    required this.address,
    required this.coverImageUrl,
    required this.dob,
    required this.gender,
    required this.lat,
    required this.lng,
    required this.phoneNo,
  });
  late final String address;
  late final String coverImageUrl;
  late final String dob;
  late final String gender;
  late final String lat;
  late final String lng;
  late final String phoneNo;

  Metadata.fromJson(Map<String, dynamic> json){
    address = json['address']??"";
    coverImageUrl = json['coverImageUrl']??"";
    dob = json['dob']??"";
    gender = json['gender']??"";
    lat = json['lat']??"";
    lng = json['lng']??"";
    phoneNo = json['phoneNo']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['coverImageUrl'] = coverImageUrl;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['lat'] = lat;
    _data['lng'] = lng;
    _data['phoneNo'] = phoneNo;
    return _data;
  }
}