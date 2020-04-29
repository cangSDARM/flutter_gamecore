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

class IAvatarButton extends StatelessWidget {
  IAvatarButton(
      {Key key,
      @required this.title,
      @required this.onTap,
      this.iconColor = Colors.blue,
      this.fontSize = 12,
      this.iconSize = 35,
      this.textColor,
      this.icon,
      this.child});

  final Color iconColor;
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;
  final double fontSize;
  final double iconSize;
  final Widget child; //TODO: switch it to a image
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(children: buildItems(context)),
        _buildInk(context),
      ],
    );
  }

  List<Widget> buildItems(BuildContext context) {
    return <Widget>[
      this.child ?? Icon(this.icon, color: this.iconColor, size: this.iconSize),
      Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            AppLocalizations.getI18nText(context, this.title),
            style: TextStyle(
                fontSize: this.fontSize,
                color: this.textColor ?? Colors.grey[500]),
          ))
    ];
  }

  /// 用于跳转
  Widget _buildInk(BuildContext context) {
    return Positioned.fill(
        child: InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).splashColor.withOpacity(0.0),
      highlightColor: Theme.of(context).splashColor.withOpacity(0.0),
    ));
  }
}
