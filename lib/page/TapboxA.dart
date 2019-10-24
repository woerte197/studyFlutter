import 'package:flutter/material.dart';

class TapboxA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:_TabBoxA(),
    );
  }

}

class _TabBoxA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBoxAState();
  }

}

class _TabBoxAState extends State<_TabBoxA> {
  var _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TapboxA"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new GestureDetector(
              onTap: () => _click(),

              child: Text("ACTIVY"),
            )
          ],
        ),
        color: _active ? Colors.blue : Colors.amberAccent,
      ),
    );
  }

  _click() {
    setState(() {
      _active = !_active;
    });
  }

}