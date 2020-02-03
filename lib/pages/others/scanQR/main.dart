import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

class QRPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.getI18nText(context, "others/scanQR/appbar/0")),
        ),
        body: Container(
          child: Text("Finish this --scanQR/QRPage"),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}