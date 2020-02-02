import 'package:flutter/material.dart';
import 'package:flutter_app/component/ItemList.dart';
import 'package:flutter_app/model/Item_Model.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Section(
      "最新资讯",
      typo: ItemType.latest,
      itemCount: 3,
    );
  }
}
