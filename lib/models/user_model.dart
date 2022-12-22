import 'package:objectbox/objectbox.dart';
@Entity()
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  @Id(assignable: true)
  late final int id;
  late final String name;
  late final String username;
  late final String email;
  late final String phone;
  late final String website;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['website'] = website;
    return _data;
  }
}

