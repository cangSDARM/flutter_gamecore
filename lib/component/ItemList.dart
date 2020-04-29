import 'package:flutter/material.dart';

import './Item.dart';
import '../model/Item_Model.dart';

///TODO: future 获取数据
class Section extends StatelessWidget {
  Section(this.title, {Key key, @required this.proto, this.itemCount = 0})
      : assert(itemCount >= 0);

  final String title;
  final int itemCount;
  final ItemProto proto;

  List<ItemData> get _fetchData {
    List<ItemData> _items = [];
    for (int i = 0; i < this.itemCount; i++) {
      _items.add(ItemData(
        "州长来了，终结者T-800加入《真人快打11》",
        imageSrc:
            "https://image.gcores.com/477e0252-ed0f-42e1-857b-d55ddad80b38.jpg?x-oss-process=image/resize,limit_1,m_fill,w_626,h_292/quality,q_90",
        releaseTime: DateTime.now(),
      ));
    }

    return _items;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _items = [];
    List<ItemData> _data = this._fetchData;
    _items.add(_buildTitle());
    for (int i = 0; i < this.itemCount; i++) {
      _items.add(Item(itemProto: this.proto, itemData: _data[i]));
    }

    return Column(
      children: _items,
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(" $title",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    );
  }
}
