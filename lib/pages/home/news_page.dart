import 'package:flutter/material.dart';
import 'package:flutter_app/component/Section.dart';
import 'package:flutter_app/model/Item_Model.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 14, bottom: 6, left: 14),
      child: Section(
        "最新资讯",
        proto: NewsItem(),
        itemCount: 3,
      ),
    );
  }
}
