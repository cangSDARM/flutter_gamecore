import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

/// fake a 标签
class ElementA extends StatelessWidget {
  ElementA({
    Key key,
    @required this.data,
    @required this.onTap,
    this.style,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.i18n = true,
  });

  final String data;
  final GestureTapCallback onTap;
  final TextStyle style;
  final bool i18n;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;
  final ValueChanged<bool> onHighlightChanged;
  final ValueChanged<bool> onHover;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        key: key,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onHighlightChanged: onHighlightChanged,
        onHover: onHover,
        child: Text(
          this.i18n
              ? AppLocalizations.getI18nText(context, this.data)
              : this.data,
          style: this.style,
        ),
        splashColor: Colors.transparent);
  }
}
