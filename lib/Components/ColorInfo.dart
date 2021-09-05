import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Colors.dart';
import 'package:mendeleev/Utils/Styles.dart';

class ColorInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 110,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: QColors.METALLIC
                      ),
                    ),
                    Text('Metálicos', style: infoStyle)
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: QColors.NO_METALLIC
                      ),
                      margin: EdgeInsets.all(5),
                    ),
                    Text('No Metálicos', style: infoStyle)
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
                      margin: EdgeInsets.all(5),
                    ),
                    Container(child:Text('Lantánidos', style: infoStyle))
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
                      margin: EdgeInsets.all(5),
                    ),
                    Text('Actínidos', style: infoStyle)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      margin: EdgeInsets.all(5),
                    ),
                    Text('Metaloide', style: infoStyle)
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
                      margin: EdgeInsets.all(5),
                    ),
                    Text('Halógenos', style: infoStyle)
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
                      margin: EdgeInsets.all(5),
                    ),
                    Text('Gases nobles', style: infoStyle)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}