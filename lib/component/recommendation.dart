import 'package:flutter/material.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/component/Headings.dart';

class Recommendation extends StatelessWidget {
  Recommendation({Key key, this.title, this.onMore, @required this.items})
      : assert(title != null ? onMore != null : true); //title 有则 onMore 必须有

  final String title;
  final VoidCallback onMore;
  final List<Widget> items;

  Widget createHeader(BuildContext context) {
    return this.title != null
        ? HeadingLine(
            outerPadding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 5),
            leftWidget: <Widget>[
              Text(this.title, style: Theme.of(context).textTheme.caption),
            ],
            rightWidget: ElementA(
                data: "global/components/recommendation/more",
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context)
                        .textTheme
                        .caption
                        .color
                        .withAlpha(160)),
                onTap: this.onMore),
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
