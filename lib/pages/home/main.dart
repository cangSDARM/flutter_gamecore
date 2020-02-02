import 'package:flutter/material.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/pages/home/latest_page.dart';
import '../others/serach/main.dart';
import 'package:flutter_app/pages/home/news_page.dart';
import 'package:flutter_app/Config/localizations.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int _curIndex;

  void swipe(int i) {
    if (i == _curIndex) return;

    setState(() {
      this._curIndex = i;
    });

    _pageController.animateToPage(this._curIndex,
        duration: new Duration(seconds: 2), curve: new ElasticOutCurve(0.8));
  }

  TextStyle switchTheme(int i, BuildContext context){
    if(this._curIndex == i)
      return Theme.of(context).textTheme.title;
    else
      return Theme.of(context).textTheme.subtitle;
  }

  @override
  void initState() {
    super.initState();

    _curIndex = 0; //make this banner always show first image.
    _pageController = PageController(initialPage: _curIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(titleBuilder: <Tag_a>[
        Tag_a(
          //fake a 标签
          onTap: () => {this.swipe(0)},
          innerText: Text(AppLocalizations.getI18nText(context, "home/appbar/0"), style: this.switchTheme(0, context)),
        ),
        Tag_a(
          onTap: () => {this.swipe(1)},
          innerText: Text(AppLocalizations.getI18nText(context, "home/appbar/1"), style: this.switchTheme(1, context)),
        ),
      ], actions: <IconButton>[
        IconButton(
            icon: Icon(Icons.lightbulb_outline),
            tooltip: AppLocalizations.getI18nText(context, "home/actions/0"),
            onPressed: () => debugPrint("TODO: 通知")),
        IconButton(
          icon: Icon(Icons.search),
          tooltip: AppLocalizations.getI18nText(context, "home/actions/1"),
          onPressed: () {
            SearchPage.navigateToSearch(context);
          },
        ),
      ]),
      backgroundColor: Colors.white,
      body: HomeContainer(pageController: this._pageController, swipe: swipe),
    );
  }
}

class HomeContainer extends StatelessWidget {
  HomeContainer({Key key, @required this.pageController, @required this.swipe});

  final PageController pageController;
  final ValueChanged<int> swipe;

  List<Widget> get page {
    return [
      LatestPage(),
      NewsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 2,
        controller: pageController,
        onPageChanged: swipe,
        itemBuilder: (context, index) {
          return page[index % page.length];
        });
  }
}
