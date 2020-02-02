import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/AppBars.dart';
import '../others/serach/main.dart';

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleNormal: Text(AppLocalizations.getI18nText(context, "radio/title"),
            style: Theme.of(context).textTheme.title),
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: AppLocalizations.getI18nText(context, "radio/actions/0"),
            onPressed: () {
              SearchPage.navigateToSearch(context);
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _RadioContainer(),
    );
  }
}

class _RadioContainer extends StatelessWidget {
  _RadioContainer({Key key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("TODO: finish this --RadioPage"),
    );
  }
}
