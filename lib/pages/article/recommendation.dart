import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';

class Recommendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      AppLocalizations.getI18nText(
                          context, "article/page/recommendation/title"),
                      style: Theme.of(context).textTheme.caption),
                  Tag_a(
                    innerText: Text(AppLocalizations.getI18nText(
                          context, "article/page/recommendation/more"), style: TextStyle(fontSize: 16)),
                    onTap: () {
                      debugPrint("TODO: 查看更多");
                    },
                  )
                ],
              ),
            ),
            SingleChildScrollView(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: this.buildItems(context)))
          ],
        ));
  }

  //TODO: 生成推荐
  List<Widget> buildItems(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(CardWrapper(
        size: [180, 220],
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
