import 'package:flutter/material.dart';
import 'package:flutter_app/page/test.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "sadasd",

      home: new Scaffold(
          appBar: new AppBar(
            title: Text("sadsad"),
          ),
          body: MyRouterHome()),
    );
  }
}

class MyRouterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("sadasdasd"),
          new Text("sadasdasd"),
          new Text("sadasdasd"),
          new Text("sadasdasd"),
          new FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return Test();
                        },
                        fullscreenDialog: true));
              },
              child: Text("open New Route"))
        ],
      ),
    );
  }
}
