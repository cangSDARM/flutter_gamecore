import 'package:flutter/material.dart';
import 'package:flutter_app/component/InheritedContext.dart';

class Brief extends StatelessWidget {
  Brief(
      {Key key, @required this.title, this.subTitle = "", this.duration = ""});

  final String title;
  final String subTitle;
  final String duration;

  @override
  Widget build(BuildContext context) {
    final double height = InheritedContext.of(context).data ?? 160.0;

    return Expanded(
        child: Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildTitle(title: this.title, desc: this.subTitle),
          ),
          Text(this.duration, style: TextStyle(color: Colors.black54))
        ],
      ),
    ));
  }

  /// 右边上边
  List<Widget> _buildTitle({String title = "", String desc = ""}) {
    return <Widget>[
      RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        text: TextSpan(
          text: title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
      Text(desc,
          style: TextStyle(color: Colors.black54, fontSize: 14.0),
          overflow: TextOverflow.ellipsis)
    ];
  }
}
