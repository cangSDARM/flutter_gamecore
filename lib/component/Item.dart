import 'package:flutter/material.dart';
import './CardWrapper.dart';
import '../model/Item_Model.dart';

///TODO: 处理releaseTime，以及其他数据
class Item extends StatelessWidget{
  Item({Key key, @required this.itemProto, @required this.itemData});

  final ItemProto itemProto;
  final ItemData itemData;

  ///设置具体Item的尺寸
  List<double> get _setsItemSize{
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

  Container _createContainer({Widget child}){
    return Container(
      width: double.infinity,
      height: this.itemProto.height,
      margin: EdgeInsets.only(top: 0, right: 14, bottom: 6, left: 14),
      child: child,
    );
  }

  Widget _buildContent(){
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
                      children: this.itemProto.createTimeOut(
                          itemData.releaseTime.toIso8601String()
                      ),
                    ),
                  ),
                  this.itemProto.createBottomInfo(
                    "${itemData.description}""|"
                    "${itemData.reviewNum}""|"
                    "${itemData.loveNum}"
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _buildInk(BuildContext context){
    return Positioned.fill(
      child: this._createContainer(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              ///TODO: 跳转
            },
            splashColor: Theme.of(context).splashColor.withOpacity(0.3),
            highlightColor: Theme.of(context).splashColor.withOpacity(0.1),
          ),
        ),
      )
    );
  }

}