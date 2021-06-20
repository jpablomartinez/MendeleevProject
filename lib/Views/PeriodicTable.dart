import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mendeleev/Components/ChemicalElement.dart';
import 'package:mendeleev/Components/ChemicalElementDescription.dart';
import 'package:mendeleev/Components/ColorInfo.dart';
import 'package:mendeleev/Models/ChemicalElement.dart';
import 'package:mendeleev/Utils/GlobalFunctions.dart';
import '../Components/ChemicalElement.dart';
import '../Utils/Colors.dart';
import '../Utils/elements.dart';

class PeriodicTable extends StatefulWidget{

  _PeriodicTable createState() => _PeriodicTable();

}

class _PeriodicTable extends State<PeriodicTable>{

  double baseWidth = 0;
  double baseHeight = 0;
  bool firstRender = false;
  Widget selectedElement = Container();

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  Widget buildGroup(int amount, {int jump = 0, int generate = 18}) {
    List<int> group = List.generate(generate, (index) => index +  amount);
    if(jump != 0){
      for(int i = 2; i < group.length; i++) group[i]+=jump;
    }
    List<Widget> r = [];
    group.forEach((index) {
      r.add(
          ChemicalElementWidget(
              symbol: periodicTableElements[index]['symbol'],
              atomicNumber: periodicTableElements[index]['atomicNumber'],
              category: periodicTableElements[index]['category'],
              index: index,
              tapFunction: this.selectElement
          )
      );
    });
    return Row(
      children: r,
    );
  }

  void selectElement(int pos){
    ChemicalElement e = ChemicalElement(periodicTableElements[pos]);
    setState(() {
      selectedElement = ChemicalElementDescription(element: e);
    });
  }

  @override
  Widget build(BuildContext context){

    Size size = MediaQuery.of(context).size;
    Orientation or = MediaQuery.of(context).orientation;

    if(!firstRender){
      if(or == Orientation.landscape){
        baseWidth = size.width;
        baseHeight = size.height;
        firstRender = true;
        ChemicalElement e = ChemicalElement(periodicTableElements[0]);
        selectedElement = ChemicalElementDescription(element: e);
      }
    }

    return Scaffold(
      backgroundColor: QColors.BACKGROUND_COLOR,
      body:
        Center(
          child:
            Container(
              width: baseWidth*0.98,
              height: baseHeight*0.95,
              //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 15,
                    left: 250,
                    child: ColorInfo()
                  ),
                  Positioned(
                      top: 20,
                      left: 130,
                      width: 110,
                      height: 110,
                      child: selectedElement
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildGroup(0,generate: 1),
                            SizedBox(width: 578,),
                          ],
                        ),
                        Row(
                          children: [
                            buildGroup(2,generate: 2),
                            SizedBox(width: 340),
                            buildGroup(4, generate: 6)
                          ],
                        ),
                        Row(
                          children: [
                            buildGroup(10,generate: 2),
                            SizedBox(width: 340),
                            buildGroup(12, generate: 6)
                          ],
                        ),
                        buildGroup(18),
                        buildGroup(36),
                        buildGroup(54, jump: 14),
                        buildGroup(86, jump: 14),
                        Row(
                          children: [
                            SizedBox(width: 68,),
                            buildGroup(56, generate: 14),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 68,),
                            buildGroup(88, generate: 14)
                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            )
        )
    );
  }
}
