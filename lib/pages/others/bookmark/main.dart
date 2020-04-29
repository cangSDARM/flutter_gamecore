import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/Texts.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/bookmark/appbar/0"),
      ),
      body: Center(
        child: EmptyText(title: "others/bookmark/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => BookmarkPage()));
  }

  static Widget showButton(BuildContext context) {
    return IAvatarButton(
      title: "others/bookmark/appbar/0",
      icon: Icons.bookmark,
      onTap: () => BookmarkPage.navigateTo(context),
      iconColor: Colors.orange,
    );
  }
}
