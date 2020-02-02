import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/HTMLElement_a.dart';
import 'package:flutter_app/component/AppBars.dart';
import 'package:flutter_app/model/Sets_Model.dart';

import '../others/settings/main.dart';
import '../others/scanQR/main.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        titleBuilder: <Tag_a>[],
        actions: <IconButton>[
          IconButton(
            icon: Icon(Icons.all_out),
            tooltip: AppLocalizations.getI18nText(context, "mine/actions/0"),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => QRPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: AppLocalizations.getI18nText(context, "mine/actions/0"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => Sets(sets: setsList),
              ));
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _MineContainer(),
    );
  }
}

class _MineContainer extends StatelessWidget {
  _MineContainer({Key key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("TODO: finish this --MinePage"),
    );
  }
}
