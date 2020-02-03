import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/ItemList.dart';
import 'package:flutter_app/component/recommendation.dart';
import 'package:flutter_app/model/Item_Model.dart';
import './newest.dart';
import '../others/serach/main.dart';

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: Text(
            AppLocalizations.getI18nText(context, "radio/appbar/0"),
            style: Theme.of(context).textTheme.title),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: AppLocalizations.getI18nText(context, "radio/actions/0"),
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
    for (int i = 0; i < 10; i++) {
      list.add(Column(
        children: <Widget>[
          CardWrapper(
            size: const [180, 180],
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
            width: 180,
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text("我们的校园故事，有关学习，生活和青春",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption),
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
            debugPrint("TODO");
          },
          items: this.buildRecommendationItems(context)),
      Center(
        //TODO: 不用Section
        child: Section(
          "电台列表 --Not Finished",
          typo: ItemType.gadio,
          itemCount: 3,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this.itemBuilder(context),
    );
  }
}
