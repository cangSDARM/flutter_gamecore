import 'package:flutter/material.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';

import './coming_soon.dart';
import './discounts.dart';

class Discounts extends StatefulWidget {
  @override
  _Discounts createState() => _Discounts();

  static void navigateToDiscounts(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Discounts()));
  }
}

class _Discounts extends State<Discounts> {
  PageController _pageController;
  int _curIndex;

  void swipe(int i) {
    if (i == _curIndex) return;

    setState(() {
      this._curIndex = i;
    });

    _pageController.animateToPage(this._curIndex, duration: new Duration(seconds: 2), curve: new ElasticOutCurve(0.8));
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
            data: "others/discounts/appbar/discounts",
            style: this.switchTheme(0, context),
          ),
          ElementA(
            onTap: () => {this.swipe(1)},
            data: "others/discounts/appbar/comingSoon",
            style: this.switchTheme(1, context),
          ),
        ],
      ),
      body: DiscountsContainer(pageController: this._pageController, swipe: swipe),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

class DiscountsContainer extends StatelessWidget {
  DiscountsContainer({Key key, @required this.pageController, @required this.swipe});

  final PageController pageController;
  final ValueChanged<int> swipe;

  List<Widget> get page {
    return [
      DynamicPage(),
      CommunicationPage(),
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
