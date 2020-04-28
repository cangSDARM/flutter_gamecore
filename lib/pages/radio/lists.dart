import 'package:flutter/material.dart' hide Icons;
import 'package:flutter_app/Config/icons.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/Headings.dart';
import 'package:flutter_app/component/IconButtons.dart';
import 'package:flutter_app/component/SectionFooter.dart';

class Lists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.section(context),
    );
  }

  List<Widget> section(BuildContext context) {
    List<Widget> list = [
      HeadingLine(
        outerPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        leftWidget: <Widget>[Text("电台列表")],
        rightWidget: Container(
          child: Row(
            children: <Widget>[Text("Filter"), Text("Download")],
          ),
        ),
      )
    ];
    for (int i = 0; i < 10; i++) {
      list.add(this.buildRadioItem(context));
    }
    return list;
  }

  Widget buildRadioItem(BuildContext context) {
    const String theme = "Gadio News";
    const String title = "下代主机将如何从固态硬盘SSD中受益";
    const int like = 393;
    return HeadingLine(
      leftAlignment: CrossAxisAlignment.start,
      outerPadding: EdgeInsets.symmetric(horizontal: 12.0),
      leftWidget: <Widget>[
        CardWrapper(
          circularRadius: 10,
          size: const [70, 70],
          elevation: 1,
          child: InkWell(
            child: Container(
              color: Colors.orange,
            ),
            onTap: () {
              debugPrint("TODO: 's CardView");
            },
          ),
        ),
        Container(
          height: 70,
          padding: EdgeInsets.only(top: 6, bottom: 5, left: 8, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, maxLines: 2),
              SectionFooter(
                theme: theme,
                like: like,
                comment: -999,
              )
            ],
          ),
        ),
      ],
      rightWidget: IButton(
        icon: Icons.ellipsis,
        iconSize: 18,
        color: Colors.grey.withAlpha(200),
        onPressed: () {
          debugPrint("TODO: 完成分享");
        },
      ),
    );
  }
}
