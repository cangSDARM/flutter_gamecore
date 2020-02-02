import 'package:flutter/material.dart';

/// fake a 标签
// ignore: camel_case_types
class Tag_a extends InkWell {
  Tag_a({
    Key key,
    @required Text innerText,
    @required GestureTapCallback onTap,
    GestureTapCallback onDoubleTap,
    GestureLongPressCallback onLongPress,
    GestureTapDownCallback onTapDown,
    GestureTapCancelCallback onTapCancel,
    ValueChanged<bool> onHighlightChanged,
    ValueChanged<bool> onHover,
  }) : super(
    key: key,
    onTap: onTap,
    onDoubleTap: onDoubleTap,
    onLongPress: onLongPress,
    onTapDown: onTapDown,
    onTapCancel: onTapCancel,
    child: innerText,
    splashColor: Colors.transparent,
  );
}