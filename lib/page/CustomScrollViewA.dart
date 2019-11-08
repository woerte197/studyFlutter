import 'package:flutter/material.dart';

class CustomScrollViewA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollViewB(),
      ),
    );
  }
}

class CustomScrollViewB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomScrollViewState();
  }
}

class CustomScrollViewState extends State<CustomScrollViewB> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Demo"),
            background:  new Image(
              image: AssetImage('assets/home_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: new SliverGrid(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan,
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4)),
        ),
        SliverFixedExtentList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text("list item $index"),
              );
            }, childCount: 50),
            itemExtent: 50.0)
      ],
    );
  }
}
