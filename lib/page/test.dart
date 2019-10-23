import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
////          child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
//        ),
//      ),
      theme: new ThemeData(
        primaryColor: Colors.amberAccent,
      ),
      home: AddCountPage(),
    );
  }
}

class AddCountPage extends StatefulWidget {
  @override
  createState() => _addCountPageState();
}

class _addCountPageState extends State<AddCountPage> {
  var _count =0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: new Text("数字 $_count"),
      floatingActionButton: new FloatingActionButton(onPressed: _onAdd,child: Icon(Icons.add),),
    );
  }
  _onAdd(){
    setState(() {
      _count++;
    });
  }
}
