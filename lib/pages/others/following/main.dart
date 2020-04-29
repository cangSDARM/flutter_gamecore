import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/Texts.dart';

class FollowingPage extends StatelessWidget {
  FollowingPage({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/following/appbar/0"),
      ),
      body: Center(
        child: EmptyText(title: "others/following/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => FollowingPage()));
  }

  static Widget showButton(BuildContext context) {
    return IAvatarButton(
      onTap: () => FollowingPage.navigateTo(context),
      textColor: Colors.black87,
      title: "0",
      fontSize: 18,
      child: Text(
          AppLocalizations.getI18nText(context, "others/following/appbar/0"),
          style: TextStyle(fontSize: 12, color: Colors.grey[500])),
    );
  }
}
