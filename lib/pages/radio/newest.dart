import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/component/CardWrapper.dart';

class Newest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[_buildContent(), _buildInk(context)],
        ));
  }

  /// 左边的图片
  Widget _buildCard({BuildContext context}) {
    return CardWrapper(
        elevation: 2,
        circularRadius: 6,
        size: [160, 160],
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              'https://img3.doubanio.com/icon/ul124559729-4.jpg',
              fit: BoxFit.fill,
            ),
            Positioned.fill(
                child: Icon(Icons.play_circle_filled,
                    color: Color.fromARGB(155, 150, 150, 150), size: 60))
          ],
        ));
  }

  /// 右边上边
  List<Widget> _buildTop({String title = "NULL", String desc = ""}) {
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
          style: TextStyle(color: Colors.black54),
          overflow: TextOverflow.ellipsis)
    ];
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCard(),
        Expanded(
            child: Container(
          height: 160,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildTop(
                    title: "白话 Vol.02 | 2019年给我留下深刻印象的那些文章",
                    desc: "来自 Gadio Early Access"),
              ),
              Text("35:56", style: TextStyle(color: Colors.black54))
            ],
          ),
        )),
      ],
    );
  }

  /// 用于跳转
  Widget _buildInk(BuildContext context) {
    return Positioned.fill(
        child: InkWell(
      onTap: () {
        debugPrint("TODO:");

        ///TODO: 跳转
      },
      splashColor: Theme.of(context).splashColor.withOpacity(0.0),
      highlightColor: Theme.of(context).splashColor.withOpacity(0.0),
    ));
  }
}
