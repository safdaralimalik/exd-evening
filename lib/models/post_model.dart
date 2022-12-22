import 'package:objectbox/objectbox.dart';
@Entity()
class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  PostModel.autoId({
    required this.userId,
    required this.title,
    required this.body,
  });
  @Id(assignable: false)
   int? id;
  late final int userId;
  late final String title;
  late final String body;

  PostModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['id'] = id;
    _data['title'] = title;
    _data['body'] = body;
    return _data;
  }
}