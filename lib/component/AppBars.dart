import 'package:flutter/material.dart' hide Icons;
import 'package:flutter/services.dart';
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/IconButtons.dart';

import './HTMLElement_a.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar(
      {Key key,
      this.titleBuilder = const [],
      this.titleNormal,
      this.actions = const [],
      this.leading = false,
      this.transparent = false})
      : assert((titleNormal != null) || (titleBuilder != null)),
        preferredSize = Size.fromHeight(kToolbarHeight);

  final bool leading;
  final bool transparent;
  final List<ElementA> titleBuilder;
  final Widget titleNormal;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Navigator.canPop(context)
          ? IButton(
              iconSize: 20,
              icon: Icons.left_open,
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      titleSpacing: 0.0,
      title: _buildTitle(titleNormal, titleBuilder, context),
      actions: _buildMargin(actions, marginRight: 8),
      backgroundColor: this.transparent
          ? Colors.white.withAlpha(150)
          : Theme.of(context).appBarTheme.color,
      elevation: Theme.of(context).appBarTheme.elevation,
      brightness: Theme.of(context).brightness,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
    );
  }

  static Widget _buildTitle(
      Widget titleNormal, List<Widget> title, BuildContext context) {
    dynamic titles = [
      Container(
        margin: EdgeInsets.only(left: 16),
      )
    ];
    titles.addAll(_buildMargin(title));

    titles = titleNormal == null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: titles,
          )
        : titleNormal;

    titles = Navigator.canPop(context)
        ? Transform.translate(
            offset: Offset(-15, 0),
            child: titles,
          )
        : titles;

    return titles;
  }

  static List<Container> _buildMargin(List<Widget> list,
      {double marginRight = 12.0}) {
    return list
        .asMap()
        .values
        .map((e) => Container(
              margin: EdgeInsets.only(right: marginRight),
              child: e,
            ))
        .toList();
  }

  @override
  final Size preferredSize;
}

class AppActions extends IButton {
  AppActions(
      {Key key,
      @required IconData icon,
      @required VoidCallback onPressed,
      String tooltip})
      : super(
            icon: icon,
            tooltip: tooltip,
            onPressed: onPressed,
            color: Colors.black87);
}

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight);

  final String placeholder = "others/search/placeholder";

  void popPage(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget buildTextField(BuildContext context, String hintText) {
    final TextEditingController controller = new TextEditingController();
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.black.withAlpha(20),
        filled: true,
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).cursorColor,
          size: 18,
        ),
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
      ),
      controller: controller,
      style: TextStyle(fontSize: 15),
      maxLines: 1,
      cursorColor: Theme.of(context).cursorColor,
      autofocus: true,
      textAlign: TextAlign.left,
      onSubmitted: submitListener,
      keyboardType: TextInputType.text,
    );
  }

  void submitListener(String text) {
    print('submited $text');
  }

  @override
  Widget build(BuildContext context) {
    return Appbar(
      titleNormal: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: buildTextField(context,
                  AppLocalizations.getI18nText(context, this.placeholder)),
            ),
          )
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}

class AppTextTitle extends StatelessWidget {
  AppTextTitle(this.title, {Key key, this.i18n = true});

  final String title;
  final bool i18n;

  @override
  Widget build(BuildContext context) {
    return Text(
        this.i18n
            ? AppLocalizations.getI18nText(context, this.title)
            : this.title,
        style: Theme.of(context).textTheme.title);
  }
}
//
//class Appbar extends AppBar {
//  Appbar(
//      {Key key,
//      List<ElementA> titleBuilder,
//      Text titleNormal,
//      Color backgroundColor = Colors.white,
//      double elevation = 0.0,
//      Brightness brightness = Brightness.light,
//      List<IconButton> actions})
//      : assert((titleNormal != null) || (titleBuilder != null)),
//        super(
//          title: titleNormal == null
//              ? Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: _buildMargin(titleBuilder),
//                )
//              : titleNormal,
//          actions: actions,
//          backgroundColor: backgroundColor,
//          elevation: elevation,
//          brightness: brightness,
//        );
//
//  static List<Container> _buildMargin(List<ElementA> list) {
//    return list
//        .asMap()
//        .values
//        .map((e) => Container(
//              margin: EdgeInsets.only(right: 12.0),
//              child: e,
//            ))
//        .toList();
//  }
//}
