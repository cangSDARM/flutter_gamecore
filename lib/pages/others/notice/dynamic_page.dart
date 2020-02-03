import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("没有动态消息",
          style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600)),
    );
  }
}
