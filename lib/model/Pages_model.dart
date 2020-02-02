import 'package:flutter/material.dart';
import '../Config/pages.dart';

//import 'package:flutter_app/model/Item_Model.dart';
import 'package:flutter_app/pages/home/main.dart';
import 'package:flutter_app/pages/video/main.dart';
import 'package:flutter_app/pages/radio/main.dart';
import 'package:flutter_app/pages/article/main.dart';
import 'package:flutter_app/pages/mine/main.dart';

/// Define each basic item of the whole project's menu.
///
///  * [title] the menu title.
///  * [page] the page would be shown at this menu item.
///  * [icon] the normal icon.
///  * [activeIcon] the item has been activated.
///  * [description] the second title.
///  * [tooltip] the tooltip for the item.
class _MenuItem extends Page{
  _MenuItem({
    Key key,
    @required this.title,
    @required this.page,
    Icon icon,
    Icon activeIcon,
    String description,
    String tooltip,
  }):super(
    page: page, title: title,
    style: PageStyle(icon: icon, activeIcon: activeIcon),
    info: PageMoreInfo(description: description, tooltip: tooltip)
  );

  final Widget page;
  final String title;
}

/// Used to bottom menu.
///
///  * activated: [title], [page], [icon], [activeIcon]
final List<_MenuItem> bottomItems = [
  new _MenuItem(
    title: "global/button/titles/0",
    page: HomePage(),
    icon: Icon(Icons.dashboard, color: Colors.black),
    activeIcon: Icon(Icons.dashboard, color: Colors.deepPurple),
  ),
  new _MenuItem(
    title: "global/button/titles/1",
    page: VideoPage(),
    icon: Icon(Icons.personal_video, color: Colors.black),
    activeIcon: Icon(Icons.personal_video, color: Colors.deepPurple),
  ),
  new _MenuItem(
    title: "global/button/titles/2",
    page: RadioPage(),
    icon: Icon(Icons.developer_board, color: Colors.black),
    activeIcon: Icon(Icons.developer_board, color: Colors.deepPurple),
  ),
  new _MenuItem(
    title: "global/button/titles/3",
    page: ArticlePage(),
    icon: Icon(Icons.description, color: Colors.black),
    activeIcon: Icon(Icons.description, color: Colors.deepPurple),
  ),
  new _MenuItem(
    title: "global/button/titles/4",
    page: MinePage(),
    icon: Icon(Icons.supervisor_account, color: Colors.black),
    activeIcon: Icon(Icons.supervisor_account, color: Colors.deepPurple),
  )
];