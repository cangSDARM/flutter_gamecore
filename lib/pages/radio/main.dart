import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/recommendation.dart';
import 'package:flutter_app/pages/others/serach/main.dart';
import 'package:flutter_app/pages/others/specialTopic/main.dart';

import './lists.dart';
import './newest/main.dart';

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("radio/appbar/0"),
        actions: <AppActions>[
          AppActions(
            icon: Icons.search,
            tooltip: "radio/actions/0",
            onPressed: () {
              SearchPage.navigateToSearch(context);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _RadioContainer(),
    );
  }
}

class _RadioContainer extends StatelessWidget {
  _RadioContainer({Key key});

  List<Widget> buildRecommendationItems(BuildContext context) {
    List<Widget> list = [];
    const double width = 160;
    for (int i = 0; i < 10; i++) {
      list.add(Column(
        children: <Widget>[
          CardWrapper(
            size: const [width, width],
            child: InkWell(
              child: Container(
                color: Colors.orange,
              ),
              onTap: () {
                debugPrint("TODO: $i's CardView");
              },
            ),
            circularRadius: 8,
            elevation: 1,
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text("我们的校园故事，有关学习，生活和青春",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          )
        ],
      ));
    }
    return list;
  }

  List<Widget> itemBuilder(BuildContext context) {
    return [
      Newest(),
      Recommendation(
          title: AppLocalizations.getI18nText(
              context, "radio/recommendation/title"),
          onMore: () {
            SpecialTopic.navigateToBroadcast(context);
          },
          items: this.buildRecommendationItems(context)),
      Lists()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.itemBuilder(context),
    );
  }
}
