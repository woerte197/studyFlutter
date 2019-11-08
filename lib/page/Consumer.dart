import 'package:flutter/material.dart';
import 'package:flutter_app/page/ChangeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget {
  final Widget child;
  final Widget Function(BuildContext context, T value) builder;

  Consumer({Key key, @required this.builder,  this.child})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return builder(context, ChangeNotifierProvider.of<T>(context));
  }
}
