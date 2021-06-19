import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/GlobalFunctions.dart';
import '../Utils/Colors.dart';

class ChemicalElement extends StatelessWidget {

  final String symbol;
  final int atomicNumber;
  final int category;
  final int index;
  final Function tapFunction;

  ChemicalElement({@required this.symbol, @required this.atomicNumber, @required this.category, @required this.index ,@required this.tapFunction});

  @override
  Widget build(BuildContext context){

    return GestureDetector(
      onTap: (){
        this.tapFunction(this.index);
      },
      child:
        Container(
          height: 32,
          width: 32,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: QColors.PRIMARY_COLOR,
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
                      padding: EdgeInsets.all(2),
                      child: Text('$atomicNumber', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8))
                  ),
                  //category
                  Container(
                      height: 3,
                      width: 10,
                      padding: EdgeInsets.all(2),
                      color: GlobalFunctions.getCategoryColor(this.category)
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(2),
                child: Text(this.symbol, style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12)),
              )
            ],
          ),
        )
    );
  }
}