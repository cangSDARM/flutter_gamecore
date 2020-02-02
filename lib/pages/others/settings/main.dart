import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/Sets_Model.dart';

class Sets extends StatelessWidget{
  Sets({Key key,@required this.sets, this.title="设置"});
  final List sets;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: ListView(
          children: listBuilder(context)
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }

  List<Widget> listBuilder(BuildContext context){
    return this.sets.asMap().values.map((e)=>
      InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: setsStyle["containerBorder"]
          ),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: setsStyle["padding"],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                e.title,
                style: setsStyle["titleStyle"]
              ),
              setsStyle["icon"]
            ],
          )
        ),
        onTap: (){
          if(e.subsets != null){
            Navigator.of(context).push(subSets(e));
          }else{
            debugPrint("TODO: 实现${e.title}");
          }
        }
      )
    ).toList();
  }

  MaterialPageRoute subSets(dynamic e){
    assert(e.title != null);
    assert(e.subsets != null);
    return MaterialPageRoute(
      builder: (_)=>Sets(sets: e.subsets, title: e.title)
    );
  }
}