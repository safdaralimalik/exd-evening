class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  late final int userId;
  late final int id;
  late final String title;
  late final String body;

  PostModel.fromJson(Map<String, dynamic> json){
    userId = json['userId']??0;
    id = json['id']??0;
    title = json['title']??"n/a";
    body = json['body']??"n/a";
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