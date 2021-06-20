import 'package:flutter/material.dart';
import 'package:mendeleev/Utils/Router.dart';

void main() => runApp(MendeleevPeriodicTable());

class MendeleevPeriodicTable extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabla Periodica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
