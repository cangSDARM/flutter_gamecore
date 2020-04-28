import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/model/Sets_Model.dart';
import 'package:flutter_app/pages/mine/heading.dart';
import 'package:flutter_app/pages/mine/subpages.dart';
import 'package:flutter_app/pages/mine/tags.dart';
import 'package:flutter_app/pages/others/scanQR/main.dart';
import 'package:flutter_app/pages/others/settings/main.dart';

class MinePage extends StatelessWidget {
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return Appbar(
      transparent: true,
      titleNormal: Text(""),
      actions: <AppActions>[
        AppActions(
          icon: Icons.qrcode,
          tooltip: "mine/actions/0",
          onPressed: () {
            QRPage.navigateTo(context);
          },
        ),
        AppActions(
          icon: Icons.settings,
          tooltip: "mine/actions/0",
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Sets(sets: setsList),
            ));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: _buildAppbar(context),
      body: _MineContainer(),
    );
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
