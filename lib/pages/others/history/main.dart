import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/Texts.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/history/appbar/0"),
        actions: [
          Center(
            child: ElementA(
              data: "others/history/actions",
              onTap: () {
                debugPrint("TODO 全部清除");
              },
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Center(
        child: EmptyText(title: "others/history/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => HistoryPage()));
  }

  static Widget showButton(BuildContext context) {
    return IAvatarButton(
        title: "others/history/appbar/0",
        icon: Icons.clock,
        onTap: () => HistoryPage.navigateTo(context));
  }
}
