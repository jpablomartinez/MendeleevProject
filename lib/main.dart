import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mendeleev/DB/description.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import 'package:mendeleev/Utils/Router.dart';
import 'package:mendeleev/Utils/data.dart';
import 'package:mendeleev/Utils/elements.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ChemicalElementAdapter());
  Hive.registerAdapter(DescriptionAdapter());
  final elementsBox = await Hive.openBox('elements');
  final descriptionBox = await Hive.openBox('description');
  final prefs = await SharedPreferences.getInstance();
  bool installed = prefs.getBool('installed') ?? false;
  if(!installed) {
    final _elementsBox = Hive.box('elements');
    final _descriptionBox = Hive.box('description');
    periodicTableElements.forEach((element) {
      ChemicalElement e = ChemicalElement.fromJson(element);
      Description d = Description.fromJson(descriptions[e.atomicNumber-1]);
      _elementsBox.add(e);
      _descriptionBox.add(d);
    });
    prefs.setBool('installed', true);
  }
  return runApp(MendeleevPeriodicTable());
}

class MendeleevPeriodicTable extends StatelessWidget {
  // This widget is the root of your application.
  //final bool installed = false;
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
