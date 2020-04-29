import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/component/AppBars.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(),
      body: Center(
        child: Text("TODO, hotsport"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateToSearch(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage()));
  }
}
