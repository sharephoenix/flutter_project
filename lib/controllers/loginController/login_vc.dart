
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/base_api/models/ApiUserModel.dart';
import 'package:flutter_project/api/base_api/user_api.dart';
import 'package:flutter_project/controllers/homeController/homeVC.dart';
import 'package:flutter_project/controllers/mainController/mainController.dart';
import 'package:flutter_project/controllers/registerController/register_vc.dart';
import 'package:flutter_project/data_tool/data_tool.dart';
import 'dart:convert' as convert;

import 'package:flutter_project/user_manager/user_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginVC extends StatefulWidget {

  _loginVC createState() => _loginVC();
}

class _loginVC extends State<loginVC> {
  String _loginAccount;
  String _password;

  @override
  void initState() {
    super.initState();

  }

  _showRefresh() {
    if (UserManager.getInstance().isLogin()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return HomeVC(title: "this is my title!!");
      }));
    }
  }

  _loginAction() async {
    print(_loginAccount);
    print(_password);

    var response = await UserApi.getInstance().loginFacade(mobile: _loginAccount, code: _password);
    print("[login_result]");
    print(response.rawJson);
    /// 保存登陆信息
    var ss = convert.jsonDecode(response.rawJson);
    var currentData = ss["data"] as Map<String, dynamic>;
    print("[CurrentData]");
    print(currentData);
    await UserManager.getInstance().saveLoginInfo(currentData);
    print(UserManager.getInstance().isLogin());
    print(response.data.mobile);
    if (UserManager.getInstance().isLogin()) {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
        return MainVC();
      }), (route) => false);
    }
  }

  // 发送登录验证码
  _sendCode() async {
    print("[sendCode]");
    if (_loginAccount == null || !DataTool.isChinaPhoneLegal(_loginAccount)) {
      _showToast("请输入正确的手机号码");
      return;
    }
  }

  _showRegisterVC() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return new RegisterVC();
    }));
  }

  _showToast(String msg) {
    print('$msg');
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登陆")),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 60,
                  child: Text("账号：", textAlign: TextAlign.center,),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    onChanged: (text) {
                      _loginAccount = text;
                    },
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    decoration: InputDecoration(
                      hintText: '请输入手机号码',
                    ),
                  ),
                ),
                Container(
                  width: 22,
                  height: 22,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60,
                  child: Text("验证码：", textAlign: TextAlign.center,),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _password = text;
                    },
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    decoration: InputDecoration(
                      hintText: '请输入验证码',
                    ),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    child: Image.asset("images/send.png", width: 22, height: 22,),
                    onTap: _sendCode,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44
                  ),
                  child: RaisedButton(
                    child: Text('登陆'),
                    onPressed: _loginAction,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 44
                  ),
                  child: RaisedButton(
                    child: Text('注册'),
                    onPressed: _showRegisterVC,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}