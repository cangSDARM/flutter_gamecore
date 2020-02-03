import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  Tags({Key key, @required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: this.items
      ),
    );
  }
}
