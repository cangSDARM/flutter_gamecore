import 'package:flutter/material.dart';
import 'component/BottomBars.dart';
import 'model/Pages_model.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  @override
  void initState() {
    super.initState();
    this.currentPage = 0;
  }

  int currentPage;

  void _changePage(int index){
    this.setState(() {
      this.currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomItems[this.currentPage].page,
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomBars(
        index:this.currentPage,
        onTap:this._changePage
      ),
    );
  }

}