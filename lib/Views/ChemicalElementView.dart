import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mendeleev/Components/Properties.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import 'package:mendeleev/DB/description.dart';
import 'package:mendeleev/ObserverController.dart';
import 'package:mendeleev/Utils/Colors.dart';

class ChemicalElementView extends StatefulWidget {

  _ChemicalElementView createState()=> _ChemicalElementView();

}


class _ChemicalElementView extends State<ChemicalElementView> with SingleTickerProviderStateMixin{

  ChemicalElement element;
  Description description;
  Future loadDescription;
  Animation animation;
  AnimationController animationController;

  Future<bool> getDescription() async {
    final descriptionBox = Hive.box('description');
    print(descriptionBox.isNotEmpty);
    description = descriptionBox.values.toList().firstWhere((element) => element.atomicNumber == observer.z);
    animationController.forward();
    return Future.value(true);
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    loadDescription = getDescription();
  }

  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: QColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('Descripción', style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 20)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: QColors.PRIMARY_COLOR,
      ),
      body: FutureBuilder<bool>(
        future: loadDescription,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return FadeTransition(
                opacity: animation,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                children: [
                  //carousel images,
                  Container(
                    height: 200,
                    width: 170,
                    color: QColors.PRIMARY_TEXT,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: QColors.SELECTED_ITEM
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: QColors.PRIMARY_TEXT
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: QColors.PRIMARY_TEXT
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text(
                        description.history,
                        softWrap: true,
                        style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14)
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text(
                        description.uses,
                        softWrap: true,
                        style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14)
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Propiedades', style: TextStyle(color: QColors.OTHER_TEXT, fontStyle: FontStyle.italic, fontSize: 16, decoration: TextDecoration.underline)),
                  SizedBox(height: 10),
                  Properties(element: observer.element),
                ],
              )
              );
          }
          else {
            return Center(
              child: Container(
                height: 350,
                width: double.infinity,
                child: Column(
                  children: [
                    //logo
                    Container(
                      height: 30,
                      child: Text('Cargando descripción', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300))
                    )
                  ],
                ),
              )
            );
          }
        },
      ),
    );


  }

}