import 'package:flutter_project/api/base_api/models/ApiBaseModel.dart';
import 'dart:convert' as convert;

import 'package:flutter_project/data_tool/data_tool.dart';
import 'package:flutter_project/user_manager/user_manager.dart';

class ApiUserModel {
  String address;
  String avatar;
  String nickname;
  String email;
  String id;
  String mobile;
}

/// api interface data
class ApiLoginModel extends ApiUserModel {
  String accessToken;

  ApiLoginModel(Map<String, dynamic> object) {
    if (object == null) {
      return;
    }
    address = object["address"];
    avatar = object["avatar"];
    nickname = object["nickname"];
    email = object["email"];
    id = object["id"];
    mobile = object["mobile"];
    accessToken = object["accessToken"];
  }
}

/// api interface
class ApiLoginModelInterface extends ApiBaseModel {
  ApiLoginModel data;

  ApiLoginModelInterface(String json) {
    var response = convert.jsonDecode(json);
    code = response["code"];
    msg = response["msg"];
    var currentData = response["data"] as Map<String, dynamic>;
    if (response["data"] != null) {
      data = ApiLoginModel(currentData);
      /// 保存登陆信息
      UserManager.getInstance().saveLoginInfo(currentData);
    }
  }
}