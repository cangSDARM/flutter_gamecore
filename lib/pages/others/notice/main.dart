import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/pages/others/notice/communication_page.dart';
import 'package:flutter_app/pages/others/notice/dynamic_page.dart';
import 'package:flutter_app/pages/others/notice/notice_page.dart';

class Notice extends StatefulWidget {
  @override
  _Notice createState() => _Notice();

  static void navigateToNotice(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Notice()));
  }
}

class _Notice extends State<Notice> {
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

  TextStyle switchTheme(int i, BuildContext context) {
    if (this._curIndex == i)
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
      appBar: Appbar(
        titleBuilder: <ElementA>[
          ElementA(
            //fake a 标签
            onTap: () => {this.swipe(0)},
            data: "others/notice/appbar/0",
            style: this.switchTheme(0, context
            ),
          ),
          ElementA(
            onTap: () => {this.swipe(1)},
            data: "others/notice/appbar/1",
            style: this.switchTheme(1, context
            ),
          ),
          ElementA(
            onTap: () => {this.swipe(2)},
            data: "others/notice/appbar/2",
            style: this.switchTheme(2, context
            ),
          ),
        ],
        actions: [
          IconButton(
            icon: Icon(Icons.security),
            tooltip: AppLocalizations.getI18nText(context, "others/notice/actions/0"),
            onPressed: ()=>debugPrint("TODO: 通知页的设置项"),
          )
        ],
      ),
      body: NoticeContainer(pageController: this._pageController, swipe: swipe),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

}

class NoticeContainer extends StatelessWidget{
  NoticeContainer({Key key, @required this.pageController, @required this.swipe});

  final PageController pageController;
  final ValueChanged<int> swipe;

  List<Widget> get page {
    return [
      NoticePage(),
      DynamicPage(),
      CommunicationPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 3,
        controller: pageController,
        onPageChanged: swipe,
        itemBuilder: (context, index) {
          return page[index % page.length];
        });
  }
}