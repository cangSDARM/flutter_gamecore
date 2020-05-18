import 'package:flutter/material.dart';
import 'package:flutter_app/component/CardWrapper.dart';
import 'package:flutter_app/component/InheritedContext.dart';

class Thumbnail extends StatelessWidget {
  Thumbnail({Key key, @required this.src});

  final String src;

  @override
  Widget build(BuildContext context) {
    final double size = InheritedContext.of(context).data ?? 160.0;

    return CardWrapper(
        elevation: 2,
        circularRadius: 6,
        size: [size, size],
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.network(
              this.src,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
                child: Icon(Icons.play_circle_filled,
                    color: Color.fromARGB(155, 150, 150, 150), size: 60))
          ],
        ));
  }
}
