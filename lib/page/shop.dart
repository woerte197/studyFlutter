import 'package:flutter/material.dart';
import 'package:flutter_app/page/CartModel.dart';
import 'package:flutter_app/page/ChangeNotifierProvider.dart';
import 'package:flutter_app/page/Consumer.dart';
class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child:
          Column(
            children: <Widget>[
             Consumer<CartModel>(
               builder: (context,cart){
                 return Text ("${cart.totalPrice}");
               },
             ),
              Builder(builder: (context) {
                print("RaisedButton build"); //在后面优化部分会用到
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    //给购物车中添加商品，添加后总价会更新
                    ChangeNotifierProvider.of<CartModel>(context).add(
                        Item(20.0, 1));
                  },
                );
              }),
            ],
          )
      ),
    );
  }
}