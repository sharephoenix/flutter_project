import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/base_api/models/ApiUserModel.dart';
import 'package:flutter_project/controllers/loginController/login_vc.dart';
import 'package:flutter_project/user_manager/user_manager.dart';

class PersonProfileVC extends StatefulWidget {

  ApiUserModel _userModel;

  PersonProfileVC({ApiUserModel model}) {
    _userModel = model;
    if (model == null) {
      _userModel = UserManager.getInstance().loginModel;
    }
  }

  _PersonProfileVC createState() => _PersonProfileVC(model: _userModel);
}

class _PersonProfileVC extends State<PersonProfileVC> {
  String _avatarUrl = "https://sharephoenix.github.io/blog/assets/img/a.2d2c2d65.gif";
  String _nickname;
  String _email;
  ApiUserModel _userModel;

  _PersonProfileVC({ApiUserModel model}) {
    _userModel = model;
    _nickname = _userModel.nickname;
    _email = _userModel.email;
  }

  _logout() async {
    await UserManager.getInstance().clearLoginInfo();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute( builder: (_) {
      return loginVC();
    }), (route) => false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey,
                    child: Image.network(_avatarUrl, width: 44, height: 44),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_nickname, textAlign: TextAlign.left, style: TextStyle(
                        backgroundColor: Colors.white,
                      ),),
                      Text(_email, textAlign: TextAlign.left, style: TextStyle(
                        backgroundColor: Colors.white,
                      ),)
                    ],
                  )
                ],
              ),
            ),
            _PersonGap(),
            _ProfileCell('地址: ${_userModel.address}'),
            _PersonGap(),
            _ProfileCell('手机: ${_userModel.mobile}'),
            _PersonGap(),
            _ProfileCell('年龄: ${_userModel.age.toString()}'),
            _PersonGap(),
            Container(
              padding: EdgeInsets.all(12),
              child: Center(
                child: RaisedButton(
                  child: Text("退出登录"),
                  onPressed: _logout,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PersonGap extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      foregroundDecoration: BoxDecoration(
        color: Color.fromARGB(15, 1, 1, 1)
      ),
    );
  }
}

class _ProfileCell extends StatelessWidget {

  String _desc;

  _ProfileCell(String desc) {
    _desc = desc;
  }

  Widget build(BuildContext context) {
    var random = Random(DateTime.now().millisecond);
    var index = random.nextInt(2);
    var imageUrl = 'images/icon0.png';
    if (index == 0) {
      imageUrl = 'images/icon1.png';
    }
    return Container(
      height: 44,
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Image.asset(imageUrl, width: 22, height: 22, fit: BoxFit.fill,),
          ),
          Text('$_desc')
        ],
      ),
    );
  }
}