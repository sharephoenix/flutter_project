
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/registerController/register_vc.dart';
import 'package:flutter_project/user_manager/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginVC extends StatefulWidget {

  _loginVC createState() => _loginVC();
}

class _loginVC extends State<loginVC> {
  String _loginAccount;
  String _password;

  _showInfo() {
    print(_loginAccount);
    print(_password);
    String mobile = UserManager.getInstance().loginMobile;
    print("login::");
    print(mobile);
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
                Text("密码："),
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
                    onPressed: _showInfo,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}