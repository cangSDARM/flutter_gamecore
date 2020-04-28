import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/Config/localizations.dart';
import 'package:flutter_app/component/Headings.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HeadingLine(
      outerPadding: EdgeInsets.only(left: 12.0, right: 12, top: 10.0),
      buttonize: MaterialButton(
        elevation: 1,
        color: Theme.of(context).buttonColor,
        height: 38,
        onPressed: () {
          debugPrint("TODO: 文章精选");
        },
      ),
      leftWidget: <Widget>[
        Icon(Icons.star, size: 20, color: Colors.orange[600]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              AppLocalizations.getI18nText(context, "article/page/choices"),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        ),
      ],
      rightWidget: Icon(Icons.right_open, size: 16),
    );
  }
}
