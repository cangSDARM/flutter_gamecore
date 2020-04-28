import 'package:flutter/material.dart';
import 'package:flutter_app/component/Article.dart';

import './banner.dart';

class LatestPage extends StatelessWidget {
  List<Widget> get lists {
    return [
      LatestNews(),
      Container(
        width: double.infinity,
        height: 10,
        color: Colors.white24,
      ),
      Article(
        title: "游戏的态度：如果不\"严肃\"，你就无法感受它的魅力",
        intro: "游戏，也可以很严肃的去体验",
        usrName: "腾讯游戏学院",
        date: "1 小时前",
        theme: "有感而发",
        info: [17, 10],
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index % lists.length];
        });
  }
}
