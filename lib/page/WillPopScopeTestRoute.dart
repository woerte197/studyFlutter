import 'package:flutter/material.dart';

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() {
    return new WillPopScopeTestRouteState();
  }
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  var firstClickTime;
  String text = "双击返回退出";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (firstClickTime == null ||
            DateTime.now().difference(firstClickTime) > Duration(seconds: 1)) {
          firstClickTime = DateTime.now();
          setState(() {
            text = "再点击一次退出";
          });

          return false;
        }

        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
