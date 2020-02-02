import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import '../others/serach/main.dart';
import './recommendation.dart';
import 'package:flutter_app/component/article.dart';

class VideoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: Text(AppLocalizations.getI18nText(context, "video/title"), style: Theme.of(context).textTheme.title),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: AppLocalizations.getI18nText(context, "video/actions/0"),
            onPressed: (){
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Recommendation(),
        Article(
          title: "泰坦尼克号建造记录(完结):乘客们的故事与我的纸中世界",
          intro: "泰坦尼克号不仅仅是一条船, 它是当时那个时代的缩影"
        )
      ],
    );
  }
}