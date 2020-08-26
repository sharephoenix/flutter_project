
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/base_api/user_api.dart';
import 'package:flutter_project/controllers/homeController/homeVC.dart';
import 'package:flutter_project/controllers/registerController/register_vc.dart';
import 'package:flutter_project/home_facade.dart';
import 'package:flutter_project/user_manager/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginVC extends StatefulWidget {

  _loginVC createState() => _loginVC();
}

class _loginVC extends State<loginVC> {
  String _loginAccount;
  String _password;

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
    print(UserManager.getInstance().isLogin());
    print(response.data.mobile);
    if (UserManager.getInstance().isLogin()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return HomeVC(title: "this is my title!!");
      }));
    }
  }

  // 发送登录验证码
  _sendCode() {
    UserApi.getInstance().sendLoginCode(mobile: _loginAccount);
  }

  _showRegisterVC() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return new RegisterVC();
    }));
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
                Text("账号："),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44
                  ),
                  child: TextField(
                    textAlign: TextAlign.start,
                    obscureText: false,
                    maxLines: 1,
                    onChanged: (text) {
                      _loginAccount = text;
                    },
                    style: TextStyle(fontSize: 16.0, color: Colors.blue),
                    decoration: InputDecoration(
                      hintText: '请输入手机号码',
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("验证码："),
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
                    child: Text("发送验证码"),
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
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: 200,
                      maxHeight: 44
                  ),
                  child: RaisedButton(
                    child: Text('Refresh'),
                    onPressed: _showRefresh,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}