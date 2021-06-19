import 'package:flutter/material.dart';

class RouteSideTransition extends PageRouteBuilder {

  final Widget widget;
  final settings;

  RouteSideTransition({@required this.widget, @required this.settings}) : super(
      transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child){
        animation = CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn);
        var begin = Offset(1,0);
        var end = Offset.zero;
        var curve = Curves.fastOutSlowIn;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          //alignment: Alignment.center,
          //scale: animation,
          position: animation.drive(tween),
          child: child,
        );
      },
      settings: settings,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
        return widget;
      });

}