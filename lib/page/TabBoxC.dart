import 'package:flutter/material.dart';

class TabBoxC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBoxCState();
  }
}

class _TabBoxCState extends State<TabBoxC> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          child: TabBoxCA(
            active: _active,
            onChanged: _changeActive,
          ),
        )
      ),
    );
  }

  _changeActive() {
    setState(() {
      _active = !_active;
    });
  }
}

class TabBoxCA extends StatefulWidget {
  TabBoxCA({Key key, @required this.active, @required this.onChanged});

  final active;
  final Function onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TabBoxCAState();
  }
}

class _TabBoxCAState extends State<TabBoxCA> {
  var _highlight = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new GestureDetector(
        onTap: _OnTab,
        onTapUp: _OnTabUp,
        onTapDown: _OnTabDown,
        child: new Container(
          child: new Center(
            child: new Text(widget.active ? "active"*30 : "InActive", maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
          decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? new Border.all(
                    color: Colors.teal[700],
                    width: 10.0,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  _OnTab() {
      widget.onChanged();
  }



  void _OnTabUp(TapUpDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _OnTabDown(TapDownDetails details) {
    setState(() {
      _highlight = false;
    });
  }
}
