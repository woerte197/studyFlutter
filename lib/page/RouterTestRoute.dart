import 'package:flutter/material.dart';
import 'package:flutter_app/page/TipRoute.dart';

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        "tip_route": (context) => TipRoute(),
        "/": (context) => RouterTestBody()
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
        });
      },
    );
  }
}

class RouterTestBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
//            var result = await Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) {
//                  return TipRoute(
//                    // 路由参数
//                    text: "我是提示xxxx",
//                    test: 123,
//                  );
//                },
//              ),
//            );
            var result = await Navigator.pushNamed(context, "tip_route",
                arguments:Arg(123,123));
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text(
            "打开提示页",
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}

class Arg{
  var text;
  var test;

  Arg(this.text, this.test);

}
