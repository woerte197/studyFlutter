import 'package:flutter/material.dart';

class ScrollNotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ScrollNotificationTestRouteFull(),
      ),
    );
  }
}

class ScrollNotificationTestRouteFull extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollNotificationTestRouteFullState();
  }
}

class ScrollNotificationTestRouteFullState
    extends State<ScrollNotificationTestRouteFull> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scrollbar(
        child: NotificationListener(
            child: NotificationListener<ScrollNotification>(
              // ignore: missing_return
                onNotification: (ScrollNotification notification) {
                  double progress = notification.metrics.pixels /
                      notification.metrics.maxScrollExtent;
                  setState(() {
                    _progress = "${(progress * 100).toInt()}%";
                  });
                  print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                  //return true; //放开此行注释后，进度条将失效
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ListView.builder(
                        itemCount: 100,
                        itemExtent: 50,
                        itemBuilder:
                            (context, index) {
                          return ListTile(title: Text("$index"),);
                        }
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Text("$_progress"),
                      backgroundColor: Colors.black54,
                    )
                  ],
                ))));
  }
}
