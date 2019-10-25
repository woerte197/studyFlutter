import 'package:flutter/material.dart';

class StackT extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackA();
  }
}

class StackA extends State<StackT> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            fit: StackFit.expand, //未定位widget占满Stack整个空间
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Positioned(
                left: 18.0,
                child: Text("I am Jack"),
              ),
              Container(
                child:
                    Text("Hello world", style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                top: 80.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AlginA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: new Container(
          color: Colors.blue[50],
          child: Align(
            heightFactor: 2,
            widthFactor: 2,
            alignment: FractionalOffset(0.2, 0),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}

class Pading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Text("sadsad"),
          ),
        ),
      ),
    );
  }
}

class ConstrainedBoxA extends StatelessWidget {
  Widget redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
          ),
          child:SizedBox(
              width: 20.0,
              height: 20.0,
              child: redBox
          )
        )
      ),
    );
  }
}
