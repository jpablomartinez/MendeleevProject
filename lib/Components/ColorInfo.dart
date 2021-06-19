import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Colors.dart';

class ColorInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 110,
      padding: EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.METALLIC
                  ),
                ),
                Text('Metálicos', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.NO_METALLIC
                  ),
                ),
                Text('No Metálicos', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.LANTHANIDE
                  ),
                ),
                Container(child:Text('Lantánidos', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10)))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.ACTINIDES
                  ),
                ),
                Text('Actínidos', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.METALLOID
                  ),
                ),
                Text('Metaloide', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.HALOGENS
                  ),
                ),
                Text('Halógenos', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: QColors.NOBLE_GAS
                  ),
                ),
                Text('Gases nobles', style: TextStyle(color: QColors.SECONDARY_TEXT, fontSize: 10))
              ],
            ),
          ),
        ],
      ),
    );
  }

}