
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/base_api/baseApi.dart';
import 'package:flutter_project/controllers/homeController/homeVC.dart';
import 'package:flutter_project/user_manager/user_manager.dart';

class FacadePage extends StatefulWidget {

  FacadePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FacadePage createState() => _FacadePage();

}

class _FacadePage extends State<FacadePage> {

  _changeCounter() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (UserManager.getInstance().isLogin()) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return HomeVC(title: "this is my title!!");
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    _changeCounter();

    return Scaffold(
      body: Center(
        child:RaisedButton(
          child: Text("这里是广告界面"),
          onPressed: () => {
            _changeCounter()
          },
        )
      ),
    );
  }
}