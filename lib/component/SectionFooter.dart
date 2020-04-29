import 'package:flutter/material.dart';

class SectionFooter extends StatelessWidget {
  SectionFooter({Key key, this.theme = "", this.like = 0, this.comment = 0});

  final String theme;
  final int like;
  final int comment;

  TextStyle styleGen({Color color = Colors.black}) {
    return TextStyle(fontSize: 12, color: color);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle infoStyle = styleGen(color: Color.fromARGB(255, 120, 120, 120));

    return Row(children: [
      Text(this.theme.isNotEmpty ? "${this.theme}    " : "",
          style: styleGen(color: Colors.red[600])),
      buildInfo(this.like, Text("${this.like} 喜欢", style: infoStyle)),
      buildInfo(this.comment, Text(" · ", style: infoStyle)),
      buildInfo(
          this.comment,
          Text(
            "${this.comment} 评论",
            style: infoStyle,
          ))
    ]);
  }

  Widget buildInfo(int info, Widget widget) {
    return info >= 0 ? widget : Text("");
  }
}
