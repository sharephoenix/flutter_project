import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_project/controllers/homeController/homeVC.dart';
import 'package:flutter_project/controllers/profile/personProfileController.dart';

class MainVC extends StatefulWidget {
  _MainVC createState() => _MainVC();
}

class _MainVC extends State<MainVC> {

  int _currentIndex = 0;//记录当前选中哪个页面

  //第1步，声明PageController
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    //第2步，初始化`PageController`
    this._pageController = PageController(initialPage: this._currentIndex);
    _pageController.addListener(() {
       print("----");
    });
  }

  List<Widget> _pages = [
    HomeVC(title: "Home",),
    PersonProfileVC(),
  ];

  _tapIndex(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(this._currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text('JDShop$_currentIndex')),
      //第3步，将body设置成PageView,并配置PageView的controller属性
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: _tapIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,//底部导航栏按钮选中时的颜色
        type: BottomNavigationBarType.fixed,//底部导航栏的适配，当item多的时候都展示出来
        currentIndex: this._currentIndex,
        onTap: (index){
          _tapIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("我的")),
        ],
      ),
    );
  }
}

class CreateS extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Text("aaaa");
  }

  @override
  _CreateS createState() {
    return _CreateS();
  }
}

class _CreateS extends State<CreateS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("abc"),
      ),
    );
  }

}