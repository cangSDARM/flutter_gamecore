import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/component/CardWrapper.dart';

class Article extends StatelessWidget {
  Article({
    Key key,
    @required this.title,
    @required this.intro,
    this.avatarUrl = "https://favicon.yandex.net/favicon/csdn.net",
    this.date = "42 分钟前",
    this.usrName = "丑客",
    this.recommend = true,
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
      margin: EdgeInsets.only(bottom: 6),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: this.buildHeader(context),
          ),
          CardWrapper(
              size: [double.infinity, 160],
              elevation: 1,
              circularRadius: 6,
              child: this.contentUrl != null
                  ? Image.network(this.contentUrl)
                  : Container(color: Colors.orange)),
          Text(
            this.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
          Container(
            margin: EdgeInsets.only(top: 6, bottom: 10),
            child: Text(
              this.intro,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          this.buildFooter(context)
        ],
      ),
    );
  }

  /// Build the suffer of Header
  Widget buildSuffer(BuildContext context) {
    //TODO: finish this
    return this.recommend
        ? Chip(
            elevation: 1,
            backgroundColor: Colors.blue[600],
            avatar: Icon(Icons.data_usage, size: 18),
            label: Text("精选"),
          )
        : Container();
  }

  Row buildHeader(BuildContext context) {
    List<Widget> list = [];

    list.add(Row(
      children: <Widget>[
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
    ));
    list.add(this.buildSuffer(context));

    return this.usrName != null
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: list)
        : Row();
  }

  Row buildFooter(BuildContext context) {
    return this.theme != null
        ? Row(children: [
            Text("${this.theme}    ",
                style: Theme.of(context).textTheme.headline),
            Text("${this.info[0]} 喜欢 · ${this.info[1]} 评论")
          ])
        : Row();
  }
}
