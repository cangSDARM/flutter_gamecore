import 'package:flutter/material.dart';

class _Set{
  _Set({
    @required this.title,
    this.subsets,
    this.builder
  });

  final String title;
  final List<_Set> subsets;
  final WidgetBuilder builder;
}

final Map setsStyle = {
  "padding":const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
  "titleStyle": const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500
  ),
  "containerBorder": Border(
    bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0)
  ),
  "icon": Icon(Icons.arrow_forward_ios, color: Colors.grey[400],size: 16),
};

//TODO: i18n
final List<_Set> setsList = [
  _Set(
    title: "账号与安全",
    subsets: <_Set>[
      _Set(
        title: "手机号"
      ),
      _Set(
        title: "微信"
      ),
      _Set(
        title: "微博"
      ),
      _Set(
        title: "更换密码"
      )
    ]
  ),
  _Set(
    title: "通知消息",
    subsets: <_Set>[
      _Set(
        title: "评论或回复你"
      ),
      _Set(
        title: "关注了你"
      ),
      _Set(
        title: "赞了你"
      )
    ]
  ),
  _Set(
    title: "播放设置",
    subsets: <_Set>[
      _Set(
        title: "关闭流量播放和下载警告"
      )
    ]
  ),
  _Set(
    title: "清理缓存"
  ),
  _Set(
    title: "建议反馈"
  ),
  _Set(
    title: "关于稽核"
  ),
  _Set(
    title: "用户协议"
  ),
  _Set(
    title: "退出登陆"
  )
];