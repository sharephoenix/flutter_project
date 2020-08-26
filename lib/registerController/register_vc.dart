import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data_tool/data_tool.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterVC extends StatefulWidget {
  _RegisterVC createState() => _RegisterVC();
}

class _RegisterVC extends State<RegisterVC> {
  String _mobile;
  String _email;
  String _nickname;
  String _avatarUrl;
  String _address;
  int _age;

  _register() {
    if (_mobile.isEmpty || !DataTool.isChinaPhoneLegal(_mobile)) {
      _showToast("请输出合法手机号码!!!");
      return;
    }
    if (_email.isEmpty || !DataTool.isEmailLegal(_email)) {
      _showToast("请输入合法邮箱!!!");
      return;
    }
    if (_nickname == null || _nickname.isEmpty) {
      _showToast("请输入昵称!!!");
      return;
    }
    if (_avatarUrl == null || _avatarUrl.isEmpty) {
      _showToast("请输入头像地址!!!");
      return;
    }
    if (_address == null || _address.isEmpty) {
      _showToast("请输入地址!!!");
      return;
    }
    if (_age == null || _age <= 0) {
      _showToast("请输入年龄!!!");
      return;
    }
    print(_mobile);
    print(_email);
    print(_nickname);
    print(_avatarUrl);
    print(_address);
    print(_address);
    print(_age);
  }

  _showToast(String msg) {
    print('$msg');
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Color.fromARGB(1, 1, 1, 1),
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("手机号:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _mobile = text;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入手机号码',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("邮箱:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _email = text;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入邮箱',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("昵称:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _nickname = text;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入昵称',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("头像Url:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _avatarUrl = text;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入头像URL',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("地址:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _address = text;
                    },
                    decoration: InputDecoration(
                      hintText: '请输入地址',
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("年龄:"),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: TextField(
                    onChanged: (text) {
                      _age = int.parse(text);
                    },
                    decoration: InputDecoration(
                      hintText: '请输入年齡',
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                    maxHeight: 44,
                  ),
                  child: RaisedButton(
                    child: Text("注册"),
                    onPressed: _register
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}