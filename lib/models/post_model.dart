class PostModel {
  PostModel({
    required this.title,
    required this.body,
    required this.id,
    required this.uid,
  });
  late final String title;
  late final String body;
  late final String id;
  late final String uid;

  PostModel.fromJson(Map<String, dynamic> json,String docId){
    title = json['title'];
    body = json['body'];
    uid = json['uid']??"";
    id = docId;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['body'] = body;
    _data['id'] = id;
    _data['uid'] = uid;
    return _data;
  }
}