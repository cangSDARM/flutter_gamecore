import 'package:flutter/material.dart';

//TODO: try use this to share state in deeper parent-child as homepage's latest do.

class InheritedContext extends InheritedWidget {
  InheritedContext({Key key, @required this.data, @required Widget child})
      : super(key: key, child: child);

  final dynamic data;

  static InheritedContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedContext>();
  }

  @override
  bool updateShouldNotify(InheritedContext oldWidget) {
    return data != oldWidget.data;
  }
}

typedef VoidFunc<T> = void Function(T t);
