import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:loader_search_bar/loader_search_bar.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        defaultBar: AppBar(),
        searchHint: AppLocalizations.getI18nText(context, "others/search/placeholder"),
        iconified: false,
        attrs: SearchBarAttrs(
          searchInputMargin: EdgeInsets.all(0),
          statusBarColor: Theme.of(context).appBarTheme.color,
          searchBarColor: Theme.of(context).appBarTheme.color,
          textBoxOutlineRadius: 6,
          textBoxOutlineWidth: 0,
        ),
      ),
      body: Center(
        child: Text("TODO"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  static void navigateToSearch(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchPage()));
  }
}
