import 'package:flutter/material.dart';

class Global {
//其他库的
//  static SharedPreferences _prefs;
//  static Profile profile = Profile();
//  // 网络缓存对象
//  static NetCache netCache = NetCache();

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    debugPrint("global init");
  }
}