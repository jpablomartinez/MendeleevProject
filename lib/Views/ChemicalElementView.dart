import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mendeleev/Components/Characteristic.dart';
import 'package:mendeleev/Components/Properties.dart';
import 'package:mendeleev/Models/ChemicalElement.dart';
import 'package:mendeleev/Utils/Colors.dart';

class ChemicalElementView extends StatefulWidget {

  _ChemicalElementView createState()=> _ChemicalElementView();

}


class _ChemicalElementView extends State<ChemicalElementView>{

  ChemicalElement element;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map<String,ChemicalElement>;
    element = arguments['ch'];
    return Scaffold(
      backgroundColor: QColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('${element.name} (${element.symbol})', style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 20)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: QColors.PRIMARY_COLOR,
      ),
      body: ListView(
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
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14)
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14)
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 14)
            ),
          ),
          SizedBox(height: 20),
          Text('Propiedades', style: TextStyle(color: QColors.OTHER_TEXT, fontStyle: FontStyle.italic, fontSize: 16, decoration: TextDecoration.underline)),
          SizedBox(height: 10),
          Properties(element: element)
        ],
      ),
    );


  }

}