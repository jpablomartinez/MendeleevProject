import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Colors.dart';

class Characteristic extends StatelessWidget {

  final String name;
  final String value;

  Characteristic({
    @required this.name,
    @required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      child: Row(
        children: [
          Text(name, style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 15)),
          Text(value, style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14))
        ],
      )
    );
  }

}