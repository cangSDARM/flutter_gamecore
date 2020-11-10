import 'package:flutter/material.dart';

class _Origin {
  _Origin({
    this.title,
    this.page,
  });

  final String title;
  final Widget page;
}

class PageStyle {
  PageStyle({
    this.icon,
    this.activeIcon,
  });

  Icon icon;
  Icon activeIcon;
}

class PageMoreInfo {
  PageMoreInfo({
    this.description,
    this.tooltip,
  });

  final String description;
  final String tooltip;
}

class Page extends _Origin {
  Page({
    @required this.page,
    @required this.title,
    this.style,
    this.info,
  }) : super(title: title, page: page);

  final Widget page;
  final String title;
  final PageStyle style;
  final PageMoreInfo info;
}
