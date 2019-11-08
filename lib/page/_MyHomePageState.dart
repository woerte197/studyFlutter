import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel("samples.flutter.io/battery");
  String _batteryLevel = 'Unknown battery level.';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_batteryLevel),
          FlatButton(
            onPressed: ()=>getBarreryLevel(),
            child: Text("点击获取电池电量"),
          )
        ],
      ),
    );
  }

  Future<Null> getBarreryLevel() async {
    String batteryLevel;

    try {
      final int result = await platform.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
