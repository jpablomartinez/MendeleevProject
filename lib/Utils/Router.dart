import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/RouteSideTransition.dart';
import 'package:mendeleev/Views/Calculator.dart';
import 'package:mendeleev/Views/ChemicalElementView.dart';
import 'package:mendeleev/Views/PeriodicTable.dart';

class RouterGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return RouteSideTransition(widget: PeriodicTable(), settings: settings);
      case '/description':
        return RouteSideTransition(widget: ChemicalElementView(), settings: settings);
      case '/calculator':
        return RouteSideTransition(widget: Calculator(), settings: settings);
      default:
        return RouteSideTransition(widget: PeriodicTable(), settings: settings);
    }
  }

}