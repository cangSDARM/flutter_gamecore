import 'package:flutter/material.dart';
import 'package:flutter_app/pages/mine/tags.dart';

class SubPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tags(items: <Widget>[
      SubPage(
        title: "下载管理",
        icon: Icons.file_download,
        onTap: () {
          debugPrint('debug');
        },
        color: Colors.green,
      ),
      SubPage(
        title: "我的订阅",
        icon: Icons.add_circle,
        onTap: () {
          debugPrint('debug');
        },
      ),
      SubPage(
        title: "我的收藏",
        icon: Icons.flag,
        onTap: () {
          debugPrint('debug');
        },
        color: Colors.orange,
      ),
      SubPage(
        title: "历史记录",
        icon: Icons.access_time,
        onTap: () {
          debugPrint('debug');
        },
      )
    ]);
  }
}

class SubPage extends StatelessWidget {
  SubPage({
    Key key,
    @required this.title,
    @required this.icon,
    @required this.onTap,
    this.color = Colors.blue,
  });

  final Color color;
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(children: buildItems()),
        _buildInk(context),
      ],
    );
  }

  List<Widget> buildItems() {
    return <Widget>[
      Icon(this.icon, color: this.color, size: 35),
      Padding(
          padding: EdgeInsets.only(top: 6),
          child: Text(
            this.title,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ))
    ];
  }

  /// 用于跳转
  ///
  /// TODO: 提成component
  Widget _buildInk(BuildContext context) {
    return Positioned.fill(
        child: InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).splashColor.withOpacity(0.0),
      highlightColor: Theme.of(context).splashColor.withOpacity(0.0),
    ));
  }
}
