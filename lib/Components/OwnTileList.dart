import 'package:flutter/material.dart';

class OwnListTile extends StatelessWidget {

  final Function onPressFunction;
  final String title;

  OwnListTile({@required this.title, @required this.onPressFunction});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressFunction,
      child: Container(
        height: 48,
        margin: EdgeInsets.only(left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}