import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  Tags(
      {Key key,
      @required this.items,
      this.paddingHorizontal = 24.0,
      this.paddingVertical = 6.0});

  final List<Widget> items;
  final double paddingHorizontal;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: this.paddingHorizontal, vertical: this.paddingVertical),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: this.items),
    );
  }
}
