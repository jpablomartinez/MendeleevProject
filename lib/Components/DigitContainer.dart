import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Colors.dart';

class DigitContainer extends StatelessWidget{

  final Function function;
  final Function longPressFunction;
  final String digit;
  final bool icon;

  DigitContainer({@required this.function, @required this.digit, this.icon = false, this.longPressFunction});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> function(),
      onLongPress: ()=> longPressFunction != null ? longPressFunction() : (){},
      child: Container(
        margin: EdgeInsets.all(4),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: QColors.PRIMARY_COLOR,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0,1),
                blurRadius: 1,
                spreadRadius: 1,
              )
            ]
        ),
        child: Center(
            child: !icon ?
            Text(digit, style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 29))
            :
            Icon(Icons.backspace_outlined, color: QColors.PRIMARY_TEXT,)
        ),
      )
    );
  }

}