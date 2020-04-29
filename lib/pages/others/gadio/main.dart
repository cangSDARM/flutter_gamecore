import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/Headings.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/ItemList.dart';
import 'package:flutter_app/component/Texts.dart';
import 'package:flutter_app/model/Item_Model.dart';

class Gadio extends StatelessWidget {
  Gadio({Key key, @required this.uri});

  final String uri;

  @override
  Widget build(BuildContext context) {
    debugPrint(this.uri);

    return Scaffold(
      appBar: Appbar(
        titleNormal: AppTextTitle("others/gadio/appbar/0"),
      ),
      body: ListView(
        children: <Widget>[
          _Banner(),
          this.wrapPadding(context, _Content()),
          this.wrapPadding(context, this.buildTopic(context)),
          this.wrapPadding(context, this.buildRecommendation(context)),
          this.wrapPadding(context, this.buildDiscuss(context))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Padding wrapPadding(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: child,
    );
  }

  Widget buildTopic(BuildContext context) {
    return HeadingLine(
      outerPadding: EdgeInsets.only(),
      leftWidget: <Widget>[
        Icon(Icons.book, size: 40),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[Text("Gadio Life"), Text("频道 19530订阅")],
          ),
        )
      ],
      rightWidget: Icon(Icons.chevron_right),
    );
  }

  Widget buildRecommendation(BuildContext context) {
    return Wrap(
      children: <Widget>[Section("相关推荐", proto: NewsItem(), itemCount: 3)],
    );
  }

  ///TODO finish this
  Widget buildDiscuss(BuildContext context) {
    return ContainerText("热门评论", textAlign: TextAlign.start);
  }

  static void navigateTo(BuildContext context, String uri) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Gadio(uri: uri)));
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ...this.buildTitle(context),
        ...this.buildParticipate(context),
        ...this.buildDetails(context)
      ],
    );
  }

  List<Widget> buildTitle(BuildContext context) {
    return [
      ContainerText("啥也不干只玩游戏：春眠不觉晓，游戏真不少", fontSize: 26),
      ContainerText(
        "Respect! ! !",
        fontSize: 16,
        marginTop: 5,
      )
    ];
  }

  List<Widget> buildParticipate(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      //TODO: follow IAvatarButton TODOs do
      list.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: IAvatarButton(
          icon: Icons.ac_unit,
          onTap: () {},
          title: "others/download/appbar/0",
          fontSize: 14,
          iconSize: 60,
        ),
      ));
    }

    return [
      ContainerText(
        "参与者",
        fontSize: 14,
      ),
      Container(
        width: double.infinity,
        child: Wrap(
          spacing: 0.8,
          runSpacing: 4.0,
          alignment: WrapAlignment.center,
          children: <Widget>[...list],
        ),
      )
    ];
  }

  List<Widget> buildDetails(BuildContext context) {
    return [
      ContainerText(
        "本期时间轴制作：Revbtain、丧狗党党主席" +
            "\n" +
            "审核：Hardy" +
            "\n\n" +
            "本期游戏体验分享：《生活危机3 充值吧》、《精灵与萤火一直》、《最终幻想7 充值吧》、《XCOM奇美拉战队》、《战争激情 战略部》。" +
            "\n",
        textAlign: TextAlign.start,
        maxLines: 10,
        fontSize: 16,
      ),
      ContainerText(
        "发布于 2020/04/28",
        textAlign: TextAlign.right,
      )
    ];
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CardWrapper(
      elevation: 1,
      circularRadius: 5,
      size: [double.infinity, 200],
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.orange,
          ),
          this.buildHeading(context),
          this.buildPlay(context)
        ],
      ),
    );
  }

  Widget buildHeading(BuildContext context) {
    return HeadingLine(
        outerPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        leftWidget: <Widget>[Icon(Icons.queue_music), Text("105:59")],
        rightWidget: Theme(
          data: ThemeData(canvasColor: Colors.black.withAlpha(20)),
          child: ActionChip(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(width: 1, color: Colors.black.withAlpha(40))),
            label: Text(
              "下载",
              style: TextStyle(fontSize: 12),
            ),
            onPressed: () {
              debugPrint("完成下载");
            },
          ),
        ));
  }

  Widget buildPlay(BuildContext context) {
    return Positioned.fill(
        child: IButton(
            iconSize: 68,
            icon: Icons.play_circle_filled,
            onPressed: () {
              debugPrint("Play");
            },
            color: Colors.white.withAlpha(60)));
  }
}
