import 'package:flutter/material.dart';

class Debug {
  //当App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  final bool _inProduction = bool.fromEnvironment("dart.vm.product");

  void showDebugInfo(BuildContext context, String info){
    if(!this._inProduction){
      Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(info),
            duration: Duration(milliseconds: 500),
          ),
      );
    }
  }
}