import 'package:flutter/material.dart';

class GrideViewA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        home: new Scaffold(
      body: GrideViewB(),
    ));
  }
}

class GrideViewB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GrideViewBState();
  }
}

//class GrideViewBState extends State<GrideViewB> {
//  ScrollController con = ScrollController();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    con.addListener(() {
//      print(con.offset);
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView(
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//        crossAxisCount: 2,
//        mainAxisSpacing: 10.0,
//        crossAxisSpacing: 10.0,
//        childAspectRatio: 1.0,
//      ),
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//      ],
//      scrollDirection: Axis.vertical,
//      reverse: false,
//      controller: con,
//    );
//  }
//}
//class GrideViewBState extends State<GrideViewB> {
//  ScrollController con = ScrollController();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    con.addListener(() {
//      print(con.offset);
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//      crossAxisCount: 4,
//      childAspectRatio: 1,
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//      ],
//      scrollDirection: Axis.vertical,
//      reverse: false,
//      controller: con,
//    );
//  }
//}
//class GrideViewBState extends State<GrideViewB> {
//  ScrollController con = ScrollController();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    con.addListener(() {
//      print(con.offset);
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GridView.extent(
//    maxCrossAxisExtent: 120.0,
//    childAspectRatio: 1,
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//        Icon(Icons.ac_unit),
//      ],
//      scrollDirection: Axis.vertical,
//      reverse: false,
//      controller: con,
//    );
//  }
//}
class GrideViewBState extends State<GrideViewB> {
  ScrollController con = ScrollController();
  List<IconData> _icons = [];

  @override
  void initState() {
    getIcons();
    con.addListener(() {
      print(con.offset);
      if(con.offset>1000){
        con.animateTo(.0,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 1),
      scrollDirection: Axis.vertical,
      reverse: false,
      controller: con,
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 200) {
          getIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  void getIcons() {
    Future.delayed(Duration(microseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
