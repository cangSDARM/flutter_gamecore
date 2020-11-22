import 'package:flutter/material.dart';

class BottomNAV extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return BottomNAVState();
  }

}

class BottomNAVState extends State<BottomNAV>{
  int _currentIndex = 0;

  void _onTapHandle(int index){
    this.setState((){
      this._currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,  //不使用这个和下面的fixColor, 当item个数大于4时会不显示
      fixedColor: Theme.of(context).backgroundColor,
      onTap: _onTapHandle,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Expore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('History'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('List'),
        ),
      ]
    );
  }
}