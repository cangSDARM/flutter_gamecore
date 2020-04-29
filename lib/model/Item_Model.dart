import 'package:flutter/material.dart';

abstract class ItemProto {
  double height = 80;

  List<TextSpan> createTimeOut(String releaseString);

  ///description: Gadio Life|0|132
  Widget createBottomInfo(String description);

  List<double> itemSize(List<double> standardSize);
}

class LatestItem extends ItemProto {
  @override
  Widget createBottomInfo(String description) {
    return Text("");
  }

  @override
  List<TextSpan> createTimeOut(String releaseString) {
    return [
      TextSpan(
          text: releaseString,
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ))
    ];
  }

  @override
  List<double> itemSize(List<double> standardSize) {
    List<double> s = standardSize.map((each) => each * 0.8).toList();
    this.height *= 0.8;
    return s;
  }
}

class NewsItem extends ItemProto {
  @override
  Widget createBottomInfo(String description) {
    List<String> desc = description.split('|');

    assert(desc.length == 3);

    return RichText(
      text: TextSpan(
        text: "${desc[0]}  ${desc[1]} 喜欢 · ${desc[2]} 评论",
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  List<TextSpan> createTimeOut(String releaseString) {
    return [];
  }

  @override
  List<double> itemSize(List<double> standardSize) {
    return standardSize;
  }
}

class ItemData {
  ItemData(this.title,
      {@required this.imageSrc,
      this.releaseTime,
      this.description = "",
      this.reviewNum = 0,
      this.loveNum = 0})
      : assert(title != null),
        assert(reviewNum >= 0),
        assert(loveNum >= 0);

  final String imageSrc;
  final String title;
  final String description;
  final DateTime releaseTime;
  final int reviewNum;
  final int loveNum;
}
