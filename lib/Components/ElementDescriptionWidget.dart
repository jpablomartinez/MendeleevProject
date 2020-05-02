import 'package:flutter/material.dart';
import '../Utils/colors.dart';


class ElementDescriptionWidget extends StatelessWidget {

  final String symbol;
  final String name;
  final int atomicNumber;
  final Color category;
  final double density;
  final double atomicVol;
  final double electronegativity;
  final double tFusion;
  final double tBoiling;
  final String electronicConfiguration;
  final String oxidationStates;
  final double atomicWeight;
  final double baseWidth;
  final double baseHeight;

  ElementDescriptionWidget(
      {@required this.symbol,
       @required this.atomicNumber,
       @required this.category,
       @required this.atomicVol,
       @required this.density,
       @required this.electronegativity,
       @required this.electronicConfiguration,
       @required this.name,
       @required this.tFusion,
       @required this.tBoiling,
       @required this.oxidationStates,
       @required this.atomicWeight,
       @required this.baseWidth,
       @required this.baseHeight}
  );

  @override
  Widget build(BuildContext context){
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .3),
            offset: Offset(0,1),
            blurRadius: 1,
            spreadRadius: 1
          )
        ]
      ),
      child:Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left:5.0),
                  child: Text(this.atomicNumber.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 14))
              ),
              Container(
                  height: 5,
                  width: 25,
                  margin: EdgeInsets.only(right: 5.0),
                  color: this.category
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom:1.0),
            child: Text(this.symbol, style: TextStyle(color: PRIMARY_TEXT, fontSize: 30),),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom:1.0),
            child: Text(this.name, style: TextStyle(color: PRIMARY_TEXT, fontSize: 12),)
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom:1.0),
            child: Text(this.oxidationStates, style: TextStyle(color: PRIMARY_TEXT, fontSize: 9)),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom:1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(this.atomicWeight.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 8),),
                Text(this.electronegativity.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 8),)
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom:1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(this.density.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 8),),
                Text(this.atomicVol.toString(), style: TextStyle(color: PRIMARY_TEXT, fontSize: 8),),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom:1.0),
            child: Text(this.electronicConfiguration, style: TextStyle(color: PRIMARY_TEXT, fontSize: 8),),
          )
        ],
      ),
    );
  }

}
