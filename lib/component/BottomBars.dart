import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter_app/Config/localizations.dart';
import '../model/Pages_model.dart';

/// 使用在menuItems中的bottomItems生成底部菜单.
/// backgroundColor使用主题中的highlightColor
class BottomBars extends StatelessWidget{
  BottomBars({
    Key key,
    @required this.index,
    @required this.onTap
  }):
        assert(index <= bottomItems.length),
        assert(null != onTap);

  final int index;
  final ValueChanged<int> onTap;

  List<BubbleBottomBarItem> _itemBuilder(BuildContext context){
    List<BubbleBottomBarItem> items = [];
    for(int i=0, n=bottomItems.length; i<n; i++){
      items.add(BubbleBottomBarItem(
        backgroundColor: Theme.of(context).highlightColor,
        icon: bottomItems[i].style.icon,
        activeIcon: bottomItems[i].style.activeIcon,
        title: Text(AppLocalizations.getI18nText(context, bottomItems[i].title))
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
      opacity: .2,
      currentIndex: this.index,
      onTap: this.onTap,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      hasNotch: true, //new
      hasInk: true, //new, gives a cute ink effect
      inkColor: Colors.black12, //optional, uses theme color if not specified
      items: _itemBuilder(context),
    );
  }

}