import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ScrollControllerRoute());
  }
}

class ScrollControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScrollControllerRouteState();
  }
}

class ScrollControllerRouteState extends State<ScrollControllerRoute> {
  bool isShowBt = false;
  ScrollController controller = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      if (controller.offset > 1000 && isShowBt == false) {
        setState(() {
          isShowBt = true;
        });
      } else if (controller.offset <= 1000 && isShowBt == true) {
        setState(() {
          isShowBt = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
          child: ListView.builder(
            controller:controller,
            itemCount: 100,
            itemExtent: 50.0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
              );
            },
          )),
      floatingActionButton: !isShowBt
          ? null
          : FloatingActionButton(
          child: Icon(Icons.arrow_upward), onPressed: () {
               controller.jumpTo(0);
               setState(() {
                 isShowBt = false;
               });
      }),
    );
  }
}
