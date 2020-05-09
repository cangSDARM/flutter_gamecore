import 'package:flutter/material.dart';
import 'package:flutter_app/component/SectionFooter.dart';

import './CardWrapper.dart';
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

///TODO: 处理releaseTime，以及其他数据
class Item extends StatelessWidget {
  Item({Key key, @required this.itemProto, @required this.itemData});

  final ItemProto itemProto;
  final ItemData itemData;

  ///设置具体Item的尺寸
  List<double> get _setsItemSize {
    this.itemProto.height = 80;

    return this.itemProto.itemSize([120, 80]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        this._buildContent(),
        this._buildInk(context),
      ],
    );
  }

  Container _createContainer({Widget child}) {
    return Container(
      width: double.infinity,
      child: child,
    );
  }

  Widget _buildContent() {
    return this._createContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardWrapper(
            elevation: 2,
            circularRadius: 6,
            size: this._setsItemSize,
            child: Image.network(
              itemData.imageSrc,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
            height: this.itemProto.height,
            padding: EdgeInsets.only(left: 6, top: 4, bottom: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    text: itemData.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: this
                        .itemProto
                        .createTimeOut(itemData.releaseTime.toIso8601String()),
                  ),
                ),
                SectionFooter(
                    theme: itemData.description,
                    like: itemData.loveNum,
                    comment: itemData.reviewNum),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildInk(BuildContext context) {
    return Positioned.fill(
        child: this._createContainer(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            debugPrint("TODO: 跳转");
          },
          splashColor: Theme.of(context).splashColor.withOpacity(0.3),
          highlightColor: Theme.of(context).splashColor.withOpacity(0.1),
        ),
      ),
    ));
  }
}
