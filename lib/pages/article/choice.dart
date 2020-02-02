import 'package:flutter/material.dart';
import 'package:flutter_app/Config/localizations.dart';

class Choice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        color: Theme.of(context).buttonColor,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(Icons.stars, size: 32, color: Colors.orange[600]),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    AppLocalizations.getI18nText(context, "article/page/choices"),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15
                    )
                  ),
                )
              ],
            ),
            Icon(Icons.keyboard_arrow_right, size: 32)
          ]
        ),
        onPressed: (){ debugPrint("TODO: 文章精选"); },
      ),
    );
  }
}