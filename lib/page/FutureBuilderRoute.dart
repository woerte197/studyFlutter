import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'NetUItil.dart';

class FutureBuilderRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FutureBilderRouteState();
  }

}

class _FutureBilderRouteState extends State<FutureBuilderRoute>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: FutureBuilder(builder: (context,snapshot){
         if(snapshot.connectionState == ConnectionState.done){
           Response response = snapshot.data;
           if(snapshot.hasError){
             return Text(snapshot.error.toString());
           }
           return ListView(
             children: response.data.map<Widget>((e) =>
                 ListTile(title: Text(e["full_name"]))
             ).toList(),
           );
         }
         return CircularProgressIndicator();
      },
      future: NetUtil.ins.get("https://api.github.com/orgs/flutterchina/repos")),
    );
  }

}