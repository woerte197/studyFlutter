import 'package:flutter/material.dart';

class LinearProgressIndicatorA extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LinearProgressIndicatorAState();
  }
}

class LinearProgressIndicatorAState extends State<LinearProgressIndicatorA>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animationController.forward();
    animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.amber, end: Colors.blue)
                    .animate(animationController),
//                value: .5,
              ),
            ),
            SizedBox(
              width: 120,
              height: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white70,
                valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                strokeWidth: 2,
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 4,
              children: <Widget>[
                Chip(
                    label: new Text("A"),
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("A"))
                ),
                Chip(
                    label: new Text("B"),
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("B"))
                ),
                Chip(
                    label: new Text("C"),
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("C"))
                ),
                Chip(
                    label: new Text("D"),
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text("D"))
                )
              ],
            ),
            Flow(delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
              children: <Widget>[
                new Container(width: 80.0, height: 80.0, color: Colors.red,),
                new Container(width: 80.0, height: 80.0, color: Colors.green,),
                new Container(width: 80.0, height: 80.0, color: Colors.blue,),
                new Container(width: 80.0, height: 80.0, color: Colors.yellow,),
                new Container(width: 80.0, height: 80.0, color: Colors.brown,),
                new Container(width: 80.0, height: 80.0, color: Colors.purple,),

             Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        left: 18,
                        child: Text("你好"),
                      ),
                      Container(
                        child: Text("Hello World",style: TextStyle(color: Colors.white70),),
                        color: Colors.red,
                      ),
                      Positioned(
                        top: 10,
                        child: Text("你不好"),
                      )
                    ],
                  ),
              ],),

          ],
        ),
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context
          .getChildSize(i)
          .width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context
            .getChildSize(i)
            .height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context
            .getChildSize(i)
            .width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}