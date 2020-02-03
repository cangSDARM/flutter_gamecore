import 'package:flutter/material.dart';

class Heading extends StatelessWidget {

  Heading({Key key, @required this.userAvatar, @required this.userName});

  final String userName;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.orange,
            maxRadius: 45,
            backgroundImage:
                NetworkImage(this.userAvatar),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.userName,
                  style: Theme.of(context).textTheme.title,
                ),
                Icon(Icons.help)
              ],
            ),
          )
        ],
      ),
    );
  }
}
