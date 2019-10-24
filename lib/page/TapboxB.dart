import 'package:flutter/material.dart';

class TapboxB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBixBState();
  }
}

class _TabBixBState extends State<TapboxB> {
  var _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: _TabBoxB(
          active: _active,
          onChanged: _onChanged,
        ),
      ),
    );
  }

  _onChanged() {
    setState(() {
      _active = !_active;
    });
  }
}

class _TabBoxB extends StatelessWidget {
  final bool active;
  final Function onChanged;

  _TabBoxB({Key key, @required this.active, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () => onChanged(),
            child: Text("ACTIVY"),
          )
        ],
      ),
      color: active ? Colors.blue : Colors.amberAccent,
    );
  }
}
