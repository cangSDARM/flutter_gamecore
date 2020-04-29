import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/Texts.dart';

class SubscriptionPage extends StatelessWidget {
  SubscriptionPage({Key key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/subscription/appbar/0"),
      ),
      body: Center(
        child: EmptyText(title: "others/subscription/empty"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SubscriptionPage()));
  }

  static Widget showButton(BuildContext context) {
    return IAvatarButton(
      title: "others/subscription/appbar/0",
      icon: Icons.plus_circled,
      onTap: () => SubscriptionPage.navigateTo(context),
    );
  }
}
