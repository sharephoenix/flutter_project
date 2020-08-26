
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api/base_api/baseApi.dart';

class FacadePage extends StatefulWidget {

  FacadePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FacadePage createState() => _FacadePage();

}

class _FacadePage extends State<FacadePage> {
  int _counter = 0;

  _changeCounter() {
    setState(() {
      _counter++;
    });
    _postRequest();
  }

  _postRequest() async {
    final api = BaseApi();
    var response = await api.postRequest();
    print("******");
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + '$_counter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("this is test"),
            RaisedButton(
              onPressed: () => {
                _changeCounter()
              },
            )
          ],
        )
      ),
    );
  }
}