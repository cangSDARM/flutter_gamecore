import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/pages/mine/tags.dart';
import 'package:flutter_app/pages/others/bookmark/main.dart';
import 'package:flutter_app/pages/others/download/main.dart';
import 'package:flutter_app/pages/others/history/main.dart';
import 'package:flutter_app/pages/others/subscription/main.dart';

class SubPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tags(items: <Widget>[
      DownloadPage.showButton(context),
      SubscriptionPage.showButton(context),
      BookmarkPage.showButton(context),
      HistoryPage.showButton(context)
    ]);
  }
}
