import 'package:flutter/material.dart';

final ThemeData theme = new ThemeData(
  primarySwatch: Colors.red,
  //primary color
  scaffoldBackgroundColor: Colors.red,
  accentColor: Colors.blueGrey,
  highlightColor: Colors.red[500],
  backgroundColor: Colors.white,
  splashColor: Colors.grey,
  buttonColor: Colors.white30,
  brightness: Brightness.light,
  cursorColor: Colors.black.withAlpha(50),
  appBarTheme: AppBarTheme(color: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black87)),
  textTheme: TextTheme(
      title: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      subtitle: TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      caption: TextStyle(
//推荐
          fontSize: 18,
          color: Colors.black),
      headline: TextStyle(color: Colors.red[600], fontSize: 14, fontWeight: FontWeight.w500)),
);
