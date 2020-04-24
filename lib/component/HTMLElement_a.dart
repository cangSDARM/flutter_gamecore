import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

/// fake a 标签
class ElementA extends StatelessWidget {
  ElementA({
    Key key,
    @required this.data,
    @required this.onTap,
    TextStyle style,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    ValueChanged<bool> onHover,
    bool i18n = false,
  }) {
    this.onDoubleTap = onDoubleTap;
    this.onLongPress = onLongPress;
    this.onTapDown = onTapDown;
    this.onTapCancel = onTapCancel;
    this.onHighlightChanged = onHighlightChanged;
    this.onHover = onHover;
    this.style = style;
    this.i18n = i18n;
  }

  final String data;
  final GestureTapCallback onTap;

  TextStyle style;
  bool i18n;
  GestureTapCallback onDoubleTap;
  GestureLongPressCallback onLongPress;
  GestureTapDownCallback onTapDown;
  GestureTapCancelCallback onTapCancel;
  ValueChanged<bool> onHighlightChanged;
  ValueChanged<bool> onHover;

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
          AppLocalizations.getI18nText(context, this.data),
          style: this.style,
        ),
        splashColor: Colors.transparent);
  }
}
