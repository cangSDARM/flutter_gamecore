import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/Texts.dart';

class DownloadPage extends StatelessWidget {
  DownloadPage({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/download/appbar/0"),
        actions: <Widget>[
          Center(
            child: ElementA(
              data: "others/download/actions",
              onTap: () {
                debugPrint("TODO 全部清除");
              },
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Center(
        child: EmptyText(title: "others/download/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => DownloadPage()));
  }

  static Widget showButton(BuildContext context) {
    return IAvatarButton(
      title: "others/download/appbar/0",
      icon: Icons.download,
      onTap: () => DownloadPage.navigateTo(context),
      iconColor: Colors.green,
    );
  }
}
