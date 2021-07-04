import 'package:flutter/material.dart';

class OwnListTile extends StatelessWidget {

  final Function onPressFunction;
  final String title;
  final IconData icon;

  OwnListTile({@required this.title, @required this.onPressFunction, @required this.icon});

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
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              alignment: Alignment.center,
              child: Icon(icon, size: 20, color: Colors.white.withOpacity(0.5))
            ),
            Container(
              //padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}