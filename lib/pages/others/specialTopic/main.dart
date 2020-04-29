import 'package:flutter/material.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/CardWrapper.dart';

class SpecialTopic extends StatelessWidget {
  SpecialTopic(
      {Key key,
      @required this.title,
      this.gapWidth = 2.0,
      this.photoSize = 180,
      this.photoStretch = 1.2,
      this.broadcasting = false});

  final String title;
  final bool broadcasting;
  final double gapWidth;
  final double photoSize;
  final double photoStretch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle(this.title),
      ),
      body: this.buildContent(context),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget buildContent(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(this.buildOneLineContent(context));
      list.add(Padding(
        padding: EdgeInsets.symmetric(vertical: this.gapWidth),
      ));
    }

    return ListView(
      semanticChildCount: list.length,
      children: list,
    );
  }

  Widget buildItem(BuildContext context) {
    final List<double> size = [
      this.photoSize,
      this.photoStretch * this.photoSize
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardWrapper(
            elevation: 1,
            circularRadius: 6,
            size: size,
            child: Container(
              color: Colors.orange,
            )),
        this.broadcasting
            ? Container(
                width: this.photoSize,
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  "可以听的《莱博维茨的赞歌》",
                  maxLines: 2,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget buildOneLineContent(BuildContext context) {
    final List<double> size = [
      this.photoSize,
      this.photoStretch * this.photoSize
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        this.buildItem(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: this.gapWidth),
        ),
        this.buildItem(context)
      ],
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => SpecialTopic(title: "others/specialTopic/appbar/0")));
  }

  static void navigateToBroadcast(BuildContext context) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => SpecialTopic(
              title: "others/specialTopic/appbar/0",
              photoSize: 170,
              gapWidth: 6,
              photoStretch: 1,
              broadcasting: true,
            )));
  }
}
