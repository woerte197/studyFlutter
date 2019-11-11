import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'NetUItil.dart';

class dioa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FlatButton(onPressed: () => {dioConnect()}, child: Text("点我啊")));
  }

  dioConnect() async {
    var params = new Map();
    params["username"] = "wangyang";
    params["password"] = "wangyang11";
    Response response = await NetUtil.ins
        .get("https://book.flutterchina.club/chapter11/dio.html",queryParameters: params);
    Response response1 =  await NetUtil.ins.post("https://book.flutterchina.club/chapter11/dio.html", {"sad":12,"name":"jackma"});
    print(response1);
    print(response.data.toString());
  }
}
