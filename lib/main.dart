import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mendeleev/DB/DidYouKnow.dart';
import 'package:mendeleev/DB/description.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import 'package:mendeleev/Observer.dart';
import 'package:mendeleev/ObserverController.dart';
import 'package:mendeleev/Utils/DidYouKnowDB.dart';
import 'package:mendeleev/Utils/Router.dart';
import 'package:mendeleev/Utils/data.dart';
import 'package:mendeleev/Utils/elements.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:google_fonts/google_fonts.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ChemicalElementAdapter());
  Hive.registerAdapter(DescriptionAdapter());
  Hive.registerAdapter(DidYouKnowAdapter());
  await Hive.openBox('elements');
  await Hive.openBox('description');
  await Hive.openBox('DidYouKnow');
  final prefs = await SharedPreferences.getInstance();
  bool installed = prefs.getBool('installed') ?? false;
  if(!installed) {
    final _elementsBox = Hive.box('elements');
    final _descriptionBox = Hive.box('description');
    final _didYouKnow = Hive.box('DidYouKnow');
    periodicTableElements.forEach((element) {
      ChemicalElement e = ChemicalElement.fromJson(element);
      Description d = Description.fromJson(descriptions[e.atomicNumber-1]);
      _elementsBox.add(e);
      _descriptionBox.add(d);
    });
    data.forEach((element) {
      DidYouKnow d = DidYouKnow(amount: 0, text: element);
      _didYouKnow.add(d);
    });
    prefs.setBool('installed', true);
  }
  init();
  return runApp(MendeleevPeriodicTable());
}

class MendeleevPeriodicTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabla Periodica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme)
      ),
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
