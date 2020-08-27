
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/loginController/login_vc.dart';
import 'package:flutter_project/controllers/mainController/mainController.dart';
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
      print("[timerrrrrr]");
      if (UserManager.getInstance().isLogin()) {
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return MainVC();
        }));
      } else {
        timer.cancel();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
          return loginVC();
        }), (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _changeCounter();
  }

  @override
  Widget build(BuildContext context) {

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