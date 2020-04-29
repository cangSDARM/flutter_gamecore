import 'package:flutter/material.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/Texts.dart';

class QRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/scanQR/appbar/0"),
      ),
      body: Center(
        child: EmptyText(title: "others/scanQR/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => QRPage()));
  }
}
