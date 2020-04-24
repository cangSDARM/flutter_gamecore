// this class is used for localizations
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  ///Get i18 text
  ///
  ///[key] like: **home/appbar/0** is supported.
  static String getI18nText(BuildContext context, String key) {
    assert(key is String);
    return AppLocalizations.of(context).getText(key);
  }

  String getText(String key) {
    List<String> keys = key.split('/');
    dynamic value = language;
    while (keys.isNotEmpty) {
      String eachKey = keys.removeAt(0);
      int num = int.tryParse(eachKey) ?? -255;
      value = value[num > -1 ? num : eachKey] ?? "";
    }
    return value is String ? value : "NULL";
  }
}

Map<String, dynamic> language;

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    String scriptCode = locale.scriptCode == null ? "" : "-" + locale.scriptCode;
    String string = await rootBundle.loadString("assets/i18n/${locale.languageCode}$scriptCode.json");
    language = json.decode(string);
    return SynchronousFuture<AppLocalizations>(AppLocalizations());
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
