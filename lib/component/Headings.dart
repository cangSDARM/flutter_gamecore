import 'package:flutter/material.dart';

class HeadingLine extends StatelessWidget {
  HeadingLine(
      {Key key,
      @required this.leftWidget,
      this.rightWidget,
      this.buttonize,
      this.height = 38,
      this.outerPadding =
          const EdgeInsets.only(left: 12.0, right: 12, top: 10.0),
      this.leftAlignment = CrossAxisAlignment.center});

  final MaterialButton buttonize;
  final List<Widget> leftWidget;
  final Widget rightWidget;
  final double height;
  final EdgeInsetsGeometry outerPadding;
  final CrossAxisAlignment leftAlignment;

  Widget _buildRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(crossAxisAlignment: this.leftAlignment, children: this.leftWidget),
      this.rightWidget ?? Container(color: Colors.transparent)
    ]);
  }

  Widget _buildWrapper(BuildContext context) {
    Widget result = _buildRow(context);
    if (this.buttonize != null) {
      result = MaterialButton(
        elevation: this.buttonize.elevation,
        color: this.buttonize.color ?? Theme.of(context).buttonColor,
        height: this.buttonize.height,
        child: result,
        onPressed: this.buttonize.onPressed,
        padding: this.buttonize.padding,
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: double.infinity,
        padding: this.outerPadding,
        child: _buildWrapper(context));
  }
}
