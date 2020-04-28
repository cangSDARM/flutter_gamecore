import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/Article.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/recommendation.dart';

import '../others/serach/main.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("video/appbar/0"),
        actions: <AppActions>[
          AppActions(
            icon: Icons.search,
            tooltip: "video/actions/0",
            onPressed: () {
              SearchPage.navigateToSearch(context);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _VideoContainer(),
    );
  }
}

class _VideoContainer extends StatelessWidget {
  _VideoContainer({Key key});

  List<Widget> buildRecommendationItems(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CardWrapper(
            size: [160, 80],
            child: Container(
              color: Colors.orange,
            ),
            elevation: 2,
            circularRadius: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 160,
                  child: Text(
                    "在家健身的新选择，哈迪带你体验有氧运动游戏《Z》",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text("特别企划")
              ],
            ),
          )
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Recommendation(items: this.buildRecommendationItems(context)),
        ),
        Article(
            title: "泰坦尼克号建造记录(完结):乘客们的故事与我的纸中世界",
            intro: "泰坦尼克号不仅仅是一条船, 它是当时那个时代的缩影")
      ],
    );
  }
}
