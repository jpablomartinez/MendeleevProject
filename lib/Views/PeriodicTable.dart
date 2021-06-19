import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mendeleev/Components/ChemicalElement.dart';
import 'package:mendeleev/Components/ChemicalElementDescription.dart';
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
  //ElementWidget selectedElement;
  List<List<Widget>> elements = [];
  ChemicalElementDescription selectedElement;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  List<Widget> buildPeriod(List<int> elements){
    List<Widget> e = [];
    for(int i = 0; i < elements.length; i++){
      e.add(
          ChemicalElement(
              symbol: periodicTableElements[elements[i]]['symbol'],
              atomicNumber: periodicTableElements[elements[i]]['atomicNumber'],
              category: periodicTableElements[elements[i]]['category'],
              index: elements[i] ,tapFunction: this.selectElement
          )
      );
    }
    return e;
  }

  void buildTable(){
    List<List<int>> index = [[0,2,10,18,36,54,86],[3,11,19,37,55,87],[20,38],[21,39,71,103],[22,40,72,104],[23,41,73,105],[24,42,74,106],[25,42,75,107],[26,43,76,108],[27,44,77,109],[28,45,78,110],[29,46,79,111],[4,12,30,47,80,112],[5,13,31,49,81,113],[6,15,32,50,82,114],[7,16,33,51,83,115],[8,16,34,52,84,116],[1,9,17,35,53,85,117],[56,57,58,59,60,61,62,63,64,65,66,67,68,69,70],[88,89,90,91,92,93,94,95,96,97,98,99,100,101,102]];
    int c = index.length;
    for(int i = 0; i < c; i++){
      int cc = index[i].length;
      List<Widget> e = [];
      for(int j = 0; j < cc; j++){
        e.add(
            ChemicalElement(
              symbol: periodicTableElements[index[i][j]]['symbol'],
              atomicNumber: periodicTableElements[index[i][j]]['atomicNumber'],
              category: periodicTableElements[index[i][j]]['category'],
              index: index[i][j],
              tapFunction: this.selectElement
            )
        );
      }
      elements.add(e);
    }
  }

  Widget buildGroup(int amount, {int jump = 0, int generate = 18}) {
    List<int> group = List.generate(generate, (index) => index +  amount);
    if(jump != 0){
      for(int i = 2; i < group.length; i++) group[i]+=jump;
    }
    List<Widget> r = [];
    group.forEach((index) {
      r.add(
          ChemicalElement(
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
    setState(() {
      selectedElement = ChemicalElementDescription(
          symbol: periodicTableElements[pos]['symbol'],
          name: periodicTableElements[pos]['name'],
          atomicNumber: periodicTableElements[pos]['atomicNumber'],
          category: GlobalFunctions.getCategoryColor(periodicTableElements[pos]['category']),
          density: periodicTableElements[pos]['density'],
          atomicVol: periodicTableElements[pos]['atomicVol'],
          electronegativity: periodicTableElements[pos]['electronegativity'].toDouble(),
          tFusion: periodicTableElements[pos]['tFusion'].toDouble(),
          tBoiling: periodicTableElements[pos]['tBoiling'].toDouble(),
          electronicConfiguration: '1s',
          oxidationStates: '1, -1',
          atomicWeight: periodicTableElements[pos]['atomicWeight']
      );
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
        this.buildTable();
        selectedElement = ChemicalElementDescription(
          symbol: periodicTableElements[0]['symbol'],
          name: 'Hidrógeno',
          atomicNumber: periodicTableElements[0]['atomicNumber'],
          category: GlobalFunctions.getCategoryColor(periodicTableElements[0]['category']),
          density: periodicTableElements[0]['density'],
          atomicVol: periodicTableElements[0]['atomicVol'],
          electronegativity: periodicTableElements[0]['electronegativity'].toDouble(),
          tFusion: periodicTableElements[0]['tFusion'].toDouble(),
          tBoiling: periodicTableElements[0]['tBoiling'].toDouble(),
          electronicConfiguration: '1s',
          oxidationStates: '1, -1',
          atomicWeight: periodicTableElements[0]['atomicWeight']
        );
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
                    left: 300,
                    child:
                    Container(
                      height: 90,
                      width: 95,
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
                    ),
                  ),
                  Positioned(
                      top: 20,
                      left: 155,
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


/*
*
* */