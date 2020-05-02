import 'package:flutter/material.dart';
import '../Utils/colors.dart';
import '../Utils/Category.dart';
class ElementWidget extends StatelessWidget {

  final String symbol;
  final int atomicNumber;
  final int category;
  final double baseWidth;
  final double baseHeight;
  final int index;
  final Function tapFunction;

  ElementWidget({@required this.symbol, @required this.atomicNumber, @required this.category, @required this.baseWidth, @required this.baseHeight, @required this.index ,@required this.tapFunction});


  Color getCategoryColor(int category){
    switch(category){
      case C_METALLIC:
        return METALLIC;
      case C_NO_METALLIC:
        return NO_METALLIC;
      case C_ANFOTEROS:
        return ANFOTEROS;
      case C_DEB_METALLIC:
        return DEB_METALLIC;
      case C_NOBLE_GAS:
        return NOBLE_GAS;
      default:
        return Color(0xff000000);
    }
  }

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      onTap: (){
        this.tapFunction(this.index);
      },
      child:
        Container(
          height: 38,
          width: 38,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .30),
                  offset: Offset(0,1),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                )
              ]
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //atomic number
                  Container(
                      padding: EdgeInsets.all(2.0),
                      child: Text(this.atomicNumber.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 8))
                  ),
                  //category
                  Container(
                      height: 3,
                      width: 15,
                      padding: EdgeInsets.all(2.0),
                      color: getCategoryColor(this.category)
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(2.0),
                child: Text(this.symbol, style: TextStyle(color: PRIMARY_TEXT, fontSize: 12),),
              )
            ],
          ),
        )
    );
  }
}