import 'package:flutter/material.dart';
import 'HTMLElement_a.dart';

class Appbar extends AppBar {
  Appbar(
      {Key key,
      List<Tag_a> titleBuilder,
      Text titleNormal,
      Color backgroundColor = Colors.red,
      double elevation,
      @required List<IconButton> actions})
      : assert((titleNormal != null) || (titleBuilder != null)),
        super(
          title: titleNormal == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildMargin(titleBuilder),
                )
              : titleNormal,
          actions: actions,
          backgroundColor: backgroundColor,
          elevation: elevation,
        );

  static List<Container> _buildMargin(List<Tag_a> list) {
    return list
        .asMap()
        .values
        .map((e) => Container(
              margin: EdgeInsets.only(right: 12.0),
              child: e,
            ))
        .toList();
  }
}
