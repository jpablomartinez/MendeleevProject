import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mendeleev/Components/Element.dart';
import 'package:mendeleev/Components/ElementDescriptionWidget.dart';
import '../Utils/colors.dart';
import '../Utils/Category.dart';
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
  ElementDescriptionWidget selectedElement;

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
      e.add(ElementWidget(symbol: periodicTableElements[elements[i]]['symbol'], atomicNumber: periodicTableElements[elements[i]]['atomicNumber'], category: periodicTableElements[elements[i]]['category'], baseWidth: baseWidth, baseHeight:baseHeight, index: elements[i] ,tapFunction: this.selectElement));
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
        print('j:$j');
        e.add(ElementWidget(symbol: periodicTableElements[index[i][j]]['symbol'], atomicNumber: periodicTableElements[index[i][j]]['atomicNumber'], category: periodicTableElements[index[i][j]]['category'], baseWidth: baseWidth, baseHeight:baseHeight, index: index[i][j] ,tapFunction: this.selectElement));
      }
      elements.add(e);
    }
  }
  
  void selectElement(int pos){
    setState(() {
      selectedElement = ElementDescriptionWidget(symbol: periodicTableElements[pos]['symbol'],name: periodicTableElements[pos]['name'],atomicNumber: periodicTableElements[pos]['atomicNumber'], category: this.getColor(periodicTableElements[pos]['category']), density: periodicTableElements[pos]['density'], atomicVol: periodicTableElements[pos]['atomicVol'], electronegativity: periodicTableElements[pos]['electronegativity'], tFusion: periodicTableElements[pos]['tFusion'], tBoiling: periodicTableElements[pos]['tBoiling'], electronicConfiguration: '1s', oxidationStates: '1, -1',atomicWeight: periodicTableElements[pos]['atomicWeight'], baseWidth: baseWidth, baseHeight: baseHeight,);
    });
  }

  Color getColor(int category){
    switch(category){
      case 0:
        return NO_METALLIC;
      case 1:
        return METALLIC;
      case 2:
        return ANFOTEROS;
      case 3:
        return DEB_METALLIC;
      case 4:
        return NOBLE_GAS;
      default:
        return Color(0xffffffff);
    }
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
        selectedElement = ElementDescriptionWidget(symbol: periodicTableElements[0]['symbol'],name: 'Hidrógeno',atomicNumber: periodicTableElements[0]['atomicNumber'], category: this.getColor(periodicTableElements[0]['category']), density: periodicTableElements[0]['density'], atomicVol: periodicTableElements[0]['atomicVol'], electronegativity: periodicTableElements[0]['electronegativity'], tFusion: periodicTableElements[0]['tFusion'], tBoiling: periodicTableElements[0]['tBoiling'], electronicConfiguration: '1s', oxidationStates: '1, -1',atomicWeight: periodicTableElements[0]['atomicWeight'], baseWidth: baseWidth, baseHeight: baseHeight,);
      }
    }

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body:
        Center(
          child:
            Container(
              width: baseWidth*0.98,
              height: baseHeight*0.88,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 30,
                    child: Column(
                      //children: buildPeriod([0,2,10,18,36,54,86]),
                      children: elements[0],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 40,
                    child: Column(
                      //children: buildPeriod([3,11,19,37,55,87]),
                      children: elements[1],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 80,
                    child: Column(
                      //children: buildPeriod([20,38]),
                      children: elements[2],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 120,
                    child: Column(
                      //children: buildPeriod([21,39,71,103]),
                      children: elements[3],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 160,
                    child: Column(
                      //children: buildPeriod([22,40,72,104]),
                      children: elements[4],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 200,
                    child: Column(
                      //children: buildPeriod([23,41,73,105]),
                      children: elements[5],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 240,
                    child: Column(
                      //children: buildPeriod([24,42,74,106]),
                      children: elements[6],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 280,
                    child: Column(
                      //children: buildPeriod([25,42,75,107]),
                      children: elements[7],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 320,
                    child: Column(
                      //children: buildPeriod([26,43,76,108]),
                      children: elements[8],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 360,
                    child: Column(
                      //children: buildPeriod([27,44,77,109]),
                      children: elements[9],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 400,
                    child: Column(
                      //children: buildPeriod([28,45,78,110]),
                      children: elements[10],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 440,
                    child: Column(
                      //children: buildPeriod([29,46,79,111]),
                      children: elements[11],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 480,
                    child: Column(
                      //children: buildPeriod([4,12,30,47,80,112]),
                      children: elements[12],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 520,
                    child: Column(
                      //children: buildPeriod([5,13,31,49,81,113]),
                      children: elements[13],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 560,
                    child: Column(
                      //children: buildPeriod([6,15,32,50,82,114]),
                      children: elements[14],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 600,
                    child: Column(
                      //children: buildPeriod([7,16,33,51,83,115]),
                      children: elements[15],
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 640,
                    child: Column(
                      //children: buildPeriod([8,16,34,52,84,116]),
                      children: elements[16],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 680,
                    child: Column(
                      //children: buildPeriod([1,9,17,35,53,85,117]),
                      children: elements[17],
                    ),
                  ),
                  Positioned(
                    top: 315,
                    left: 120,
                    child: Row(
                      //children: buildPeriod([56,57,58,59,60,61,62,63,64,65,66,67,68,69,70]),
                      children: elements[18],
                    ),
                  ),
                  Positioned(
                    top: 355,
                    left: 120,
                    child: Row(
                      //children: buildPeriod([88,89,90,91,92,93,94,95,96,97,98,99,100,101,102]),
                      children: elements[19],
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 200,
                    width: 110,
                    height: 110,
                    child: selectedElement
                  ),
                  Positioned(
                      top: 33,
                      left: 350,
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
                                          color: NO_METALLIC
                                      ),
                                    ),
                                    Container(child:Text('No metálicos', style: TextStyle(color: SECONDARY_TEXT, fontSize: 10),))
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
                                          color: METALLIC
                                      ),
                                    ),
                                    Text('Metálicos', style: TextStyle(color: SECONDARY_TEXT, fontSize: 10),)
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
                                          color: ANFOTEROS
                                      ),
                                    ),
                                    Text('Anfóteros', style: TextStyle(color: SECONDARY_TEXT, fontSize: 10),)
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
                                          color: DEB_METALLIC
                                      ),
                                    ),
                                    Text('Débil metálicos', style: TextStyle(color: SECONDARY_TEXT, fontSize: 10),)
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
                                          color: NOBLE_GAS
                                      ),
                                    ),
                                    Text('Gases nobles', style: TextStyle(color: SECONDARY_TEXT, fontSize: 10),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                ],
              ),
            ),
        )
    );
  }
}