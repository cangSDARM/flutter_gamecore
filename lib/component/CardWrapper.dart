import 'package:flutter/material.dart';

/// 一个自定义的CardWrapper
///
/// [size] 长度固定为2, 第一个为宽, 第二个为高
class CardWrapper extends StatelessWidget{
  CardWrapper({
    Key key,
    @required this.size,
    @required this.child,
    this.elevation = 20.0,
    this.circularRadius = 20.0
  }):assert(circularRadius != null), assert(child != null), assert(elevation != null), assert(size.length == 2);

  final Widget child;
  final List<double> size;
  final double elevation;
  final double circularRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size[0],
      height: this.size[1],
      child: Card(
        child: this.child,
        elevation: this.elevation,  //z轴的高度，设置card的阴影
        shape: RoundedRectangleBorder(  //设置shape，这里设置成了R角
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(this.circularRadius),
              topRight: Radius.circular(this.circularRadius),
              bottomLeft: Radius.circular(this.circularRadius),
              bottomRight: Radius.circular(this.circularRadius),
            ),
        ),
        clipBehavior: Clip.antiAlias, //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
        semanticContainer: false,
      ),
    );
  }
}