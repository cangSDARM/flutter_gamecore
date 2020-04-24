import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/BanerBar.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/ItemList.dart';
import 'package:flutter_app/model/Item_Model.dart';

class LatestNews extends StatelessWidget {
  LatestNews({Key key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardWrapper(
          size: <double>[390, 200],
          circularRadius: 16,
          elevation: 4,
          child: BannerBar(
            images: <String>[
              //TODO
              'https://img3.doubanio.com/icon/ul1218430-446.jpg',
              'https://img3.doubanio.com/icon/ul124559729-4.jpg'
            ],
          ),
        ),
        Section(
          AppLocalizations.getI18nText(
              context, "home/latestpage/banner/section"),
          typo: ItemType.latest,
          itemCount: 3,
        ),
        Container(
          width: double.infinity,
          height: 48,
          child: MaterialButton(
            child: Text(
              AppLocalizations.getI18nText(
                  context, "home/latestpage/banner/more"),
            ),
            onPressed: () {
              debugPrint("Flat"); //TODO
            },
            padding: EdgeInsets.all(0),
            splashColor: Colors.grey,
            highlightColor: Colors.white70,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.black12, width: 1))),
        )
      ],
    );
  }
}
