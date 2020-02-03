import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/model/Sets_Model.dart';
import 'package:flutter_app/pages/mine/heading.dart';
import 'package:flutter_app/pages/mine/subpages.dart';
import 'package:flutter_app/pages/mine/tags.dart';

import '../others/settings/main.dart';
import '../others/scanQR/main.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            _MineContainer(),
            Container(
              height: 80,
              child: Appbar(
                titleNormal: Text(""),
                elevation: 0,
                backgroundColor:
                    Theme.of(context).backgroundColor.withOpacity(0.6),
                actions: <IconButton>[
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.all_out),
                    tooltip:
                        AppLocalizations.getI18nText(context, "mine/actions/0"),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => QRPage()));
                    },
                  ),
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.settings),
                    tooltip:
                        AppLocalizations.getI18nText(context, "mine/actions/0"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => Sets(sets: setsList),
                      ));
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class _MineContainer extends StatelessWidget {
  _MineContainer({Key key});

  List<Widget> buildItems(BuildContext context) {
    return [
      Container(height: 45), //For appbar translate
      Heading(
          userAvatar: "https://favicon.yandex.net/favicon/csdn.net",
          userName: "xXxx"),
      Tags(items: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("已关注",
                      style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                  Text("0", style: TextStyle(fontSize: 18))
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "被关注",
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  Text("0", style: TextStyle(fontSize: 18))
                ],
              ),
            ],
          ),
        ),
        OutlineButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              side: BorderSide(width: 2)),
          child: Text("编辑资料"),
          onPressed: () {
            debugPrint("TODO");
          },
        )
      ]),
      SubPages(),
      Container(
        height: 8,
        width: double.infinity,
        color: Colors.grey[300],
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Center(
          //TODO: style
          child: Text("尚未发布内容", style: Theme.of(context).textTheme.caption),
        ),
      ),
      Center(
        child: Text(
          "2018-04-24 加入",
          style: TextStyle(color: Colors.grey[500]),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: buildItems(context));
  }
}
