import 'package:flutter/material.dart';
import 'package:flutter_app/component/CardWrapper.dart';

class Recommendation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 8),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: this.buildItems(context),
        ),
      )
    );
  }
  
  List<Widget> buildItems(BuildContext context){
    List<Widget> list = [];
    for(var i=0; i<10; i++){
      list.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardWrapper(
            size: [160, 80],
            child: Container(
              color: Colors.orange,
            ),
            elevation: 2,
            circularRadius: 8,
          ),
          Container(
            width: 160,
            child: Text(
              "在家健身的新选择，哈迪带你体验有氧运动游戏《Z》",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Text("特别企划")
        ],
      ));
    }
    return list;
  }
}