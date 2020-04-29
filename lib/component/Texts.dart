import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

class ContainerText extends StatelessWidget {
  ContainerText(this.data,
      {Key key,
      this.marginTop = 0,
      this.fontSize = 16,
      this.textAlign = TextAlign.center,
      this.maxLines = 2});

  final String data;
  final double marginTop;
  final double fontSize;
  final TextAlign textAlign;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: this.marginTop),
      width: double.infinity,
      child: Text(
        this.data,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(fontSize: this.fontSize),
      ),
    );
  }
}

///TODO, contains a center or wrap to another component
class EmptyText extends StatelessWidget {
  EmptyText({Key key, @required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.getI18nText(context, title),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30, color: Colors.blueGrey, fontWeight: FontWeight.w600));
  }
}
