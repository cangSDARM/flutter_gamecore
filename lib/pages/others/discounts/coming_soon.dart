import 'package:flutter/material.dart';

class CommunicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("没有通知消息",
          style: TextStyle(
              fontSize: 30,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600)),
    );
  }
}
