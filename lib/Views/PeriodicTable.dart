import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mendeleev/Components/ChemicalElement.dart';
import 'package:mendeleev/Components/ChemicalElementDescription.dart';
import 'package:mendeleev/Components/ColorInfo.dart';
import 'package:mendeleev/Components/OwnTileList.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import '../Components/ChemicalElement.dart';
import '../Utils/Colors.dart';

class PeriodicTable extends StatefulWidget{

  _PeriodicTable createState() => _PeriodicTable();

}

class _PeriodicTable extends State<PeriodicTable> with SingleTickerProviderStateMixin{

  double baseWidth = 0;
  double baseHeight = 0;
  bool firstRender = false;
  int itemSelected = 0;
  Widget selectedElement = Container();
  Future configApp;
  List<ChemicalElement> periodicTableElementsBD = [];
  AnimationController animationController;
  Animation animation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> prepareApp() async {
    final elementsBox = Hive.box('elements');
    elementsBox.values.forEach((element) {
      periodicTableElementsBD.add(element);
    });
    ChemicalElement e = periodicTableElementsBD[0];
    selectedElement = ChemicalElementDescription(element: e);
    animationController.forward();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    return Future.value(true);
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
              symbol: periodicTableElementsBD[index].symbol,
              atomicNumber: periodicTableElementsBD[index].atomicNumber,
              category: periodicTableElementsBD[index].category,
              index: index,
              tapFunction: this.selectElement,
              selected: itemSelected == periodicTableElementsBD[index].atomicNumber,
          )
      );
    });
    return Row(
      children: r,
    );
  }

  void selectElement(int pos){
    ChemicalElement e = periodicTableElementsBD[pos];
    itemSelected = e.atomicNumber;
    setState(() {
      selectedElement = ChemicalElementDescription(element: e);
    });
  }

  @override
  void initState(){
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    configApp = prepareApp();
    super.initState();
    /*/SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);*/
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
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
      }
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: QColors.BACKGROUND_COLOR,
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: QColors.PRIMARY_COLOR,
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      //logo
                    ),
                  ],
                ),
                Divider(color: QColors.PRIMARY_TEXT, height: 2, indent: 30, endIndent: 30),
                SizedBox(height: 20),
                OwnListTile(
                    title: 'Tabla Periódica',
                    onPressFunction: (){}
                ),
                OwnListTile(
                    title: 'Calculadora',
                    onPressFunction: (){}
                ),
                OwnListTile(
                    title: 'Sugerencias o Error',
                    onPressFunction: (){}
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text('V 0.1', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12, fontWeight: FontWeight.w300)),
                  ),
                )
              ],
            ),
          )
        ),
        body: FutureBuilder<bool>(
          future: configApp,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return FadeTransition(
                  opacity: animation,
                  child: Center(
                      child:
                      Container(
                        width: baseWidth*0.98,
                        height: baseHeight*0.95,
                        //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                top: 20,
                                left: 5,
                                child: GestureDetector(
                                    onTap: () {
                                      if(_scaffoldKey.currentState.isDrawerOpen){
                                        _scaffoldKey.currentState.openEndDrawer();
                                      }else{
                                        _scaffoldKey.currentState.openDrawer();
                                      }
                                    },
                                    child: Icon(Icons.menu, color: QColors.OTHER_TEXT, size: 20)
                                )
                            ),
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
                                top: 20,
                                right: 10,
                                child: GestureDetector(
                                  onTap: (){},
                                  child: Row(
                                    children: [
                                      Icon(Icons.remove_red_eye, color: QColors.OTHER_TEXT, size: 20),
                                      SizedBox(width: 5),
                                      Text('detalles', style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 10))
                                    ],
                                  ),
                                )
                            ),
                            Positioned(
                                bottom: 0,
                                right: 18,
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
                          child: Text('Preparando aplicación', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300))
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        )
    );
  }
}
