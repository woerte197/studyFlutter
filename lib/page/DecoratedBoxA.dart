import 'package:flutter/material.dart';

class DecoratedBoxA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
//              child: Padding(
//                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
//                child: Text(
//                  "Login",
//                  style: TextStyle(color: Colors.white),
//                ),
//              ),
            child: Transform.translate(offset: Offset(-20.0, -5.0),
            child: Text("Hello World"),),
            )
          ],
        ),
      ),
    );
  }
}
