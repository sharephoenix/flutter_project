
import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  bool isLogin = false;
  String loginMobile;

  initilize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginMobile = prefs.getString("loginMobile");
  }

  _mockInitilize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loginMobile", "18817322818");
  }

  UserManager._();
  static UserManager _instance;
  static UserManager getInstance() {
    if (_instance == null) {
      _instance = UserManager._();
      _instance._mockInitilize();
    }
    return _instance;
  }
}