import 'Category.dart';
import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Colors.dart';

class GlobalFunctions{

  static Color getCategoryColor(int category){
    switch(category){
      case C_METALLIC:
        return QColors.METALLIC;
      case C_HALOGENS:
        return QColors.HALOGENS;
      case C_LANTHANIDE:
        return QColors.LANTHANIDE;
      case C_ACTINIDES:
        return QColors.ACTINIDES;
      case C_NOBLE_GAS:
        return QColors.NOBLE_GAS;
      case C_METALLOID:
        return QColors.METALLOID;
      case C_NO_METALLIC:
        return QColors.NO_METALLIC;
      default:
        return Color(0xff000000);
    }
  }

}