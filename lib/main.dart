import 'package:flutter/material.dart';
import 'package:flutter_project/home_facade.dart';
import 'package:flutter_project/loginController/login_vc.dart';
import 'package:flutter_project/user_manager/user_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget home = loginVC();
    UserManager.getInstance().initilize();
    if (UserManager.getInstance().isLogin) {
      home = FacadePage(title: 'Flutter Demo Home Page');
    }
    print(UserManager.getInstance().loginMobile);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home,
    );
  }
}
