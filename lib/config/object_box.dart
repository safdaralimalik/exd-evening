import 'package:local_storage_app/objectbox.g.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class ObjectBox{
  late final Store store;
  late final Box<PostModel> _postModelBox;
  late final Box<UserModel> _userModelBox;

  ObjectBox._init(this.store){
    _postModelBox=Box<PostModel>(store);
    _userModelBox=Box<UserModel>(store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    ObjectBox obj=ObjectBox._init(store);
    return obj;
  }

  clearAllDB(){
    _postModelBox.removeAll();
    _userModelBox.removeAll();
  }

  /// Post CRUD
  // query
 List<PostModel> getAllPostsOfUser(int userId){
    final query=_postModelBox.query(PostModel_.userId.equals(userId)).build();
    List<PostModel> list=query.find();
    return list;

 }
  insertPostModel(PostModel detail){
    _postModelBox.put(detail);
  }
  insertAllPostModel(List<PostModel> postList){
    _postModelBox.putMany(postList);
  }
  List<PostModel> getAllPostModel(){
    return _postModelBox.getAll();
  }
  int getPostModelCount() {
   return _postModelBox.count();
 }
  /// User Model CRUD
  insertAllUserMode(List<UserModel> userList){
    _userModelBox.putMany(userList);
  }




  // Stream<List<ArticleModel>> getFeaturedArticleListStream() =>
  //     _articleBox
  //         .query(ArticleModel_.isFeatured.equals(true))
  //         .watch(triggerImmediately: true)
  //         .map((query) => query.find());
  //
  // List<ArticleModel> getArticleListFromTeacherId(int teacherId) {
  //   final query =
  //   _articleBox.query(ArticleModel_.teacherId.equals("$teacherId")).build();
  //   final List<ArticleModel> articleList =
  //   query.find(); // find() returns List<Person>
  //   return articleList;
  // }

}