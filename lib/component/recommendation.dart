import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';

class Recommendation extends StatelessWidget {
  Recommendation({Key key, this.title, this.onMore, @required this.items})
      : assert(title != null ? onMore != null : true); //title 有则 onMore 必须有

  final String title;
  final VoidCallback onMore;
  final List<Widget> items;

  Padding createHeader(BuildContext context) {
    return this.title != null
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(this.title, style: Theme.of(context).textTheme.caption),
                ElementA(
                    data:
                        AppLocalizations.getI18nText(
                            context, "global/components/recommendation/more"),
                    style: TextStyle(fontSize: 16
                    ),
                    onTap: this.onMore)
              ],
            ),
          )
        : Padding(padding: EdgeInsets.symmetric(horizontal: 12.0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            this.createHeader(context),
            SingleChildScrollView(
                padding: EdgeInsets.only(left: 12.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: this.items))
          ],
        ));
  }
}
