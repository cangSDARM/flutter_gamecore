import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

class IButton extends StatelessWidget {
  IButton(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      this.color,
      this.highlightColor = Colors.transparent,
      this.splashColor = Colors.transparent,
      this.width = 30,
      this.iconSize = 24,
      this.tooltip = "",
      this.margin = const EdgeInsets.symmetric(horizontal: 2)});

  final IconData icon;
  final VoidCallback onPressed;
  final double width;
  final String tooltip;
  final EdgeInsetsGeometry margin;
  final Color color;
  final Color highlightColor;
  final Color splashColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: this.margin,
        width: this.width,
        alignment: Alignment.center,
        child: IconButton(
          icon: Icon(this.icon),
          iconSize: this.iconSize,
          color: this.color,
          highlightColor: this.highlightColor,
          splashColor: this.splashColor,
          onPressed: this.onPressed,
          tooltip: AppLocalizations.getI18nText(context, this.tooltip),
        ));
  }
}

abstract class NavigateIButton extends StatefulWidget {
  static void navigateTo(BuildContext context) {
    Navigator.of(context).pushReplacementNamed("app");
  }

  //TODO: Dart can't override static function, please replace it to another way.
  static IButton showButton(BuildContext context) {
    return null;
  }
}
