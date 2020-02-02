import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import '../others/serach/main.dart';
import './choice.dart';
import './recommendation.dart';
import '../../component/article.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: Text(
            AppLocalizations.getI18nText(context, "article/appbar/0"),
            style: Theme.of(context).textTheme.title),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: AppLocalizations.getI18nText(context, "article/actions/0"),
            onPressed: () {
              SearchPage.navigateToSearch(context);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _ArticleContainer(),
    );
  }
}

class _ArticleContainer extends StatelessWidget {
  _ArticleContainer({Key key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Choice(),
        Recommendation(),
        Article(
            title: "泰坦尼克号建造记录(完结):乘客们的故事与我的纸中世界",
            intro: "泰坦尼克号不仅仅是一条船, 它是当时那个时代的缩影")
      ],
    );
  }
}
