import 'package:flutter/material.dart';

class ShareDateWidget extends InheritedWidget {
  final int data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    // ignore: unrelated_type_equality_checks
    return oldWidget != data;
  }

  ShareDateWidget({@required this.data, Widget child}) : super(child: child);

  static ShareDateWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDateWidget);
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement buil;
//    return Text(ShareDateWidget.of(context).data.toString());
    return Text("sadhjskadksakjkjlhdash");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InheritedWidgetTestRouteState();
  }
}

class InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new ShareDateWidget(
        data: count,
        child: Column(
          children: <Widget>[
             Padding(padding: EdgeInsets.all(50)),
            _TestWidget(),
            RaisedButton(
              onPressed: (){
                setState(() {
                  count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
