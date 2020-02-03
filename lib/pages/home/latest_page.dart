import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/latest_banner.dart';

class LatestPage extends StatelessWidget {
  List<Widget> get lists {
    return [
      LatestNews(),
      Container(
        width: double.infinity,
        height: 16,
        color: Colors.black12,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index % lists.length];
        });
  }
}
