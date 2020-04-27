import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

import './HTMLElement_a.dart';

// ignore: must_be_immutable
class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({Key key, List<ElementA> titleBuilder, Text titleNormal, List<IconButton> actions})
      : assert((titleNormal != null) || (titleBuilder != null)),
        preferredSize = Size.fromHeight(kToolbarHeight) {
    this.titleBuilder = titleBuilder;
    this.titleNormal = titleNormal;
    this.actions = actions;
  }

  List<ElementA> titleBuilder;
  Text titleNormal;
  List<IconButton> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleNormal == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildMargin(titleBuilder),
            )
          : titleNormal,
      actions: actions,
      backgroundColor: Theme.of(context).appBarTheme.color,
      elevation: Theme.of(context).appBarTheme.elevation,
      brightness: Theme.of(context).brightness,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
    );
  }

  static List<Container> _buildMargin(List<ElementA> list) {
    return list
        .asMap()
        .values
        .map((e) => Container(
              margin: EdgeInsets.only(right: 12.0),
              child: e,
            ))
        .toList();
  }

  @override
  final Size preferredSize;
}

class AppActions extends IconButton {
  AppActions(
      {Key key, @required Icon icon, @required VoidCallback onPressed, @required BuildContext context, String tooltip})
      : super(
            icon: icon,
            tooltip: AppLocalizations.getI18nText(context, tooltip),
            onPressed: onPressed,
            color: Colors.black87);
}
//
//class Appbar extends AppBar {
//  Appbar(
//      {Key key,
//      List<ElementA> titleBuilder,
//      Text titleNormal,
//      Color backgroundColor = Colors.white,
//      double elevation = 0.0,
//      Brightness brightness = Brightness.light,
//      List<IconButton> actions})
//      : assert((titleNormal != null) || (titleBuilder != null)),
//        super(
//          title: titleNormal == null
//              ? Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: _buildMargin(titleBuilder),
//                )
//              : titleNormal,
//          actions: actions,
//          backgroundColor: backgroundColor,
//          elevation: elevation,
//          brightness: brightness,
//        );
//
//  static List<Container> _buildMargin(List<ElementA> list) {
//    return list
//        .asMap()
//        .values
//        .map((e) => Container(
//              margin: EdgeInsets.only(right: 12.0),
//              child: e,
//            ))
//        .toList();
//  }
//}
