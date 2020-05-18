import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/component/InheritedContext.dart';
import 'package:flutter_app/pages/others/gadio/main.dart';
import 'package:flutter_app/pages/radio/newest/brief.dart';
import 'package:flutter_app/pages/radio/newest/thumbnail.dart';

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

  Widget _buildContent() {
    return InheritedContext(
      data: 160.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Thumbnail(src: 'https://img3.doubanio.com/icon/ul124559729-4.jpg'),
          Brief(
            title: "白话 Vol.02 | 2019年给我留下深刻印象的那些文章",
            subTitle: "来自 Gadio Early Access",
            duration: "38:59",
          ),
        ],
      ),
    );
  }

  /// 用于跳转
  Widget _buildInk(BuildContext context) {
    return Positioned.fill(
        child: InkWell(
      onTap: () =>
          Gadio.navigateTo(context, "https://www.gcores.com/gadio/1012394"),
      splashColor: Theme.of(context).splashColor.withOpacity(0.0),
      highlightColor: Theme.of(context).splashColor.withOpacity(0.0),
    ));
  }
}
