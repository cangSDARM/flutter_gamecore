import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import '../others/serach/main.dart';
import './choice.dart';
import '../../component/recommendation.dart';
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
        Recommendation(
          title: AppLocalizations.getI18nText(
              context, "article/recommendation/title"),
          onMore: () {
            debugPrint("TODO: 查看更多");
          },
          items: buildRecommendationItems(context)
        ),
        Article(
            title: "泰坦尼克号建造记录(完结):乘客们的故事与我的纸中世界",
            intro: "泰坦尼克号不仅仅是一条船, 它是当时那个时代的缩影")
      ],
    );
  }


  //TODO: 生成推荐
  List<Widget> buildRecommendationItems(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(CardWrapper(
        size: const [180, 220],
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
      ));
    }
    return list;
  }
}
