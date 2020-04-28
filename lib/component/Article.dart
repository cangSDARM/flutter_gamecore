import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Icons;
import 'package:flutter/rendering.dart';
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/Headings.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/SectionFooter.dart';

class Article extends StatelessWidget {
  Article({
    Key key,
    @required this.title,
    @required this.intro,
    this.avatarUrl = "https://favicon.yandex.net/favicon/csdn.net",
    this.date = "42 分钟前",
    this.usrName = "丑客",
    this.recommend = false,
    this.contentUrl,
    this.theme,
    this.info,
  })  : assert(avatarUrl == null || (avatarUrl != null && usrName != null)),
        //avatar和usrName必须同时存在
        assert(theme == null ||
            (theme != null &&
                info != null &&
                info.length == 2)); //theme和info必须同时存在

  final String avatarUrl;
  final String usrName;
  final String date;
  final bool recommend;
  final String title;
  final String intro;
  final String contentUrl;
  final String theme;
  final List<int> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 12.0, left: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.buildHeader(context),
          ...(this.buildContainer(context)),
          this.buildFooter(context)
        ],
      ),
    );
  }

  /// Build the suffer of Header
  Widget buildSuffer(BuildContext context) {
    return this.recommend
        ? ActionChip(
            elevation: 0,
            backgroundColor: Colors.blue[600],
            avatar: Icon(Icons.circle_notch, size: 18),
            label: Text("精选"),
            onPressed: () {
              debugPrint("完成精选");
            },
          )
        : Padding(
            padding: EdgeInsets.only(right: 2),
            child: IButton(
              iconSize: 20,
              icon: Icons.ellipsis,
              onPressed: () {
                debugPrint("完成分享");
              },
            ),
          );
  }

  Widget wrapPadding(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: widget,
    );
  }

  Widget buildHeader(BuildContext context) {
    return this.wrapPadding(this.usrName != null
        ? HeadingLine(
            outerPadding: EdgeInsets.only(bottom: 5.0),
            leftWidget: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.orange,
                backgroundImage: NetworkImage(this.avatarUrl),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(this.usrName), Text(this.date)],
                ),
              )
            ],
            rightWidget: this.buildSuffer(context),
          )
        : Row());
  }

  List<Widget> buildContainer(BuildContext context) {
    return <Widget>[
      CardWrapper(
          size: [double.infinity, 160],
          elevation: 1,
          circularRadius: 6,
          child: this.contentUrl != null
              ? Image.network(this.contentUrl)
              : Container(color: Colors.orange)),
      this.wrapPadding(Text(
        this.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.caption,
      )),
      this.wrapPadding(Container(
        margin: EdgeInsets.only(top: 6, bottom: 10),
        child: Text(
          this.intro,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
      )),
    ];
  }

  Widget buildFooter(BuildContext context) {
    return this.wrapPadding(this.theme != null
        ? SectionFooter(
            theme: this.theme,
            like: this.info[0],
            comment: this.info[1],
          )
        : Row());
  }
}
