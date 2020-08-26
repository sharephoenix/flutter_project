import 'package:flutter_project/api/base_api/baseApi.dart';
import 'package:flutter_project/api/base_api/models/ApiUserModel.dart';

class UserApi extends BaseApi {
  Future<String> registerUser({String nickname, String email, String address, String avatar, int age, String mobile}) async {
    var response = await postRequest(path: "/register", headers: {
      "version": "2"
    }, body: {
      "nickname": nickname,
      "email": email,
      "address": address,
      "avatar": avatar,
      "age": age,
      "mobile": mobile,
    });
    return response;
  }

  Future<ApiLoginModelInterface> loginFacade({String mobile, String code}) async {
    var response = await postRequest(path: "/login", body: {
      "mobile": mobile,
      "code": code
    });
    return ApiLoginModelInterface(response);
  }

  // 根据手机号码发送验证码到对应的注册邮箱
  Future<String> sendLoginCode({String mobile}) async {
    var response = await fetchRequest(path: '/sendCode/$mobile');
    return response;
  }

  UserApi._();
  static UserApi _instance;
  static UserApi getInstance() {
    if (_instance == null) {
      _instance = UserApi._();
    }
    return _instance;
  }
}