import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading({@required this.loadTo, this.seconds = 3})
      : assert(loadTo != ""),
        assert(seconds > 0);

  final int seconds;
  final String loadTo;

  @override
  Widget build(BuildContext context) {
    new Future.delayed(Duration(seconds: this.seconds), () {
      debugPrint("loading...");
      Navigator.of(context).pushReplacementNamed(this.loadTo);
    });

    return Container(
      child: Image.asset("assets/loading.gif"),
    );
  }
}
