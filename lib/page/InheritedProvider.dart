import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);
}
