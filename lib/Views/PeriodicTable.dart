import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:mendeleev/Components/ChemicalElement.dart';
import 'package:mendeleev/Components/ChemicalElementDescription.dart';
import 'package:mendeleev/Components/ColorInfo.dart';
import 'package:mendeleev/Components/OwnTileList.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';
import 'package:mendeleev/ObserverController.dart';
import 'package:mendeleev/Utils/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PeriodicTable extends StatefulWidget{

  _PeriodicTable createState() => _PeriodicTable();

}

class _PeriodicTable extends State<PeriodicTable> with SingleTickerProviderStateMixin{

  double baseWidth = 0;
  double baseHeight = 0;
  bool firstRender = false;
  int itemSelected = 1;
  Size elementSize = Size(1,1);
  double spaceP23 = 1;
  double spacePL = 1;
  Widget selectedElement = Container();
  Future configApp;
  List<ChemicalElement> periodicTableElementsBD = [];
  AnimationController animationController;
  Animation animation;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int getInitialRandomElement(int l){
    DateTime now = DateTime.now();
    math.Random random = math.Random(now.millisecondsSinceEpoch);
    return random.nextInt(l);
  }

  Future<bool> prepareApp() async {
    final elementsBox = Hive.box('elements');
    elementsBox.values.forEach((element) {
      periodicTableElementsBD.add(element);
    });
    int randomElement = getInitialRandomElement(elementsBox.length - 1);
    ChemicalElement e = periodicTableElementsBD[randomElement];
    selectedElement = ChemicalElementDescription(element: e);
    observer.z = e.atomicNumber;
    observer.element = e;
    itemSelected = randomElement + 1;
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
              size: elementSize,
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
    observer.z = itemSelected;
    observer.element = e;
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
        elementSize = Size(0.047*baseWidth,0.047*baseWidth);
        spaceP23 = 10*((0.047*baseWidth)+2);
        spacePL = 2*((0.047*baseWidth)+2);
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
                      width: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),
                          Image.asset('assets/images/icon.png', height: 80, color: QColors.PRIMARY_TEXT),
                          SizedBox(height: 5),
                          Text('Sylhue', style: GoogleFonts.nunito(color: QColors.PRIMARY_TEXT, fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text('by menestrello', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12, fontWeight: FontWeight.w300)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text('V 0.1', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 11, fontWeight: FontWeight.w300)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Divider(color: QColors.PRIMARY_TEXT, height: 2, indent: 30, endIndent: 30),
                SizedBox(height: 20),
                OwnListTile(
                    title: 'Tabla Periódica',
                    onPressFunction: (){},
                    icon: Icons.auto_awesome_mosaic,
                ),
                OwnListTile(
                    title: 'Calculadora',
                    onPressFunction: ()=> Navigator.pushNamed(context, '/calculator'),
                    icon: Icons.calculate
                ),
                OwnListTile(
                    title: 'Reportar sugerencias o error',
                    onPressFunction: (){},
                    icon: Icons.announcement
                ),
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
                      child: Container(
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
                                top: baseHeight > 360 ? 28 : 23,
                                left: 240,
                                child: ColorInfo()
                            ),
                            Positioned(
                                top: baseHeight > 360 ? 28 : 23,
                                left: 130,
                                width: 110,
                                height: 110,
                                child: selectedElement
                            ),
                            Positioned(
                                top: 25,
                                right: 15,
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.pushNamed(context, '/description', arguments: {'z': itemSelected});
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 70,
                                    child: Row(
                                      children: [
                                        Icon(Icons.remove_red_eye, color: QColors.OTHER_TEXT, size: 20),
                                        SizedBox(width: 5),
                                        Text('detalles', style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 10))
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            Positioned(
                                bottom: 0,
                                left: 32,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        buildGroup(0,generate: 1),
                                        //SizedBox(width: 612), //578
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildGroup(2,generate: 2),
                                        SizedBox(width: spaceP23),
                                        buildGroup(4, generate: 6)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buildGroup(10,generate: 2),
                                        SizedBox(width: spaceP23),
                                        buildGroup(12, generate: 6)
                                      ],
                                    ),
                                    buildGroup(18),
                                    buildGroup(36),
                                    buildGroup(54, jump: 14),
                                    buildGroup(86, jump: 14),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: spacePL),
                                        buildGroup(56, generate: 14),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(width: spacePL),
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
