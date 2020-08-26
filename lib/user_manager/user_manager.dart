
import 'dart:math';

import 'package:flutter_project/api/base_api/models/ApiUserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class UserManager {
  ApiLoginModel loginModel;
  String loginInfoJson;

  bool isLogin() {
    print("[isLogin]");
    print(loginModel);
    return loginModel != null;
  }

  _initilize() async {
    if (loginInfoJson != null) {
      var loginInfo = convert.jsonDecode(loginInfoJson) as Map<String, dynamic>;
      if (loginInfo != null) {
        loginModel = ApiLoginModel(loginInfo);
      }
      return;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loginInfoJson = prefs.getString("loginUser");
    print(loginInfoJson);
    var loginInfo = convert.jsonDecode(loginInfoJson) as Map<String, dynamic>;
    if (loginInfo != null) {
      loginModel = ApiLoginModel(loginInfo);
    }
    print(loginModel.mobile);
  }

  saveLoginInfo(Map<String, dynamic> info) async {
    String json = convert.jsonEncode(info);
    loginInfoJson = json;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("loginUser", json);
    _initilize();
  }

  UserManager._();
  static UserManager _instance;
  static UserManager getInstance() {
    if (_instance == null) {
      _instance = UserManager._();
      _instance._initilize();
    }
    return _instance;
  }
}