import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static String userImageKey = "UserImageKey";
  static String userUIDKey = "userUIKey";
  static late SharedPreferences preferences;

  static initPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

 static setUserImage(String imageUrl) {
    preferences.setString(userImageKey, imageUrl);
  }

 static String getUserImage() {
    return preferences.getString(userImageKey) ?? "";
  }

 static setUserUID(String uid) {
    preferences.setString(userUIDKey, uid);
  }

static  String getUserUID() {
    return preferences.getString(userUIDKey) ?? "";
  }
}
