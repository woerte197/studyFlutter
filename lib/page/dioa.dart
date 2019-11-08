import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dioa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: FlatButton(onPressed: () => {dioConnect()}, child: Text("点我啊")));
  }

  dioConnect() async {
    Dio dio = new Dio();
    Response response = await dio.get(
        "https://kunlun-qa.shijicloud.com/kunlun-package-control/jwt/jwt_appid.jsf");
    print(response.data.toString());


  }
}
