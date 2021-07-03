import 'package:flutter/material.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import 'package:mendeleev/Utils/GlobalFunctions.dart';
import '../Utils/Colors.dart';


class ChemicalElementDescription extends StatelessWidget {

  final ChemicalElement element;

  ChemicalElementDescription({
    @required this.element
  });

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {}, //Navigator.pushNamed(context, '/description', arguments: <String, ChemicalElement> {'ch':element}),
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
            color: QColors.PRIMARY_COLOR,
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
                    child: Text('${element.atomicNumber}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 14))
                ),
                Container(
                    height: 5,
                    width: 25,
                    margin: EdgeInsets.only(right: 5.0),
                    color: GlobalFunctions.getCategoryColor(element.category)
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom:1.0),
              child: Text('${element.symbol}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 30)),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom:1.0),
                child: Text('${element.name}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12))
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom:1.0),
              child: Text('${element.oxidationStates}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 9)),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom:1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('${element.atomicWeight}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8)),
                  Text('${element.electronegativity}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8))
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom:1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('${element.density}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8)),
                  Text('${element.atomicVol}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8)),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom:1.0),
              child: Text('${element.electronicConfiguration}', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 8)),
            )
          ],
        ),
      ),
    );
  }

}
