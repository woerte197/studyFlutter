import 'package:flutter/material.dart';
import 'package:flutter_app/page/RouterTestRoute.dart';

class TipRoute extends StatelessWidget {
  var text;
  var test;
  TipRoute({Key key, @required this.text,@required this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context).settings.arguments as Arg ;
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("接受参数"),
      ),
      body: new Center(
          child: Column(
        children: <Widget>[
          new Text("我是接受的参数1${arg.text}"),
          new Text("我是接受的参数2${arg.test}"),
          new RaisedButton(
            onPressed: () => Navigator.pop(context, "我是返回值"),
            child: Text("返回 "),
          )
        ],
      )),
    );
  }
}
