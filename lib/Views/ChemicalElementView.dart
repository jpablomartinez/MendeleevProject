import 'package:flutter/material.dart';
import 'package:mendeleev/Models/ChemicalElement.dart';
import 'package:mendeleev/Utils/Colors.dart';

class ChemicalElementView extends StatefulWidget {

  _ChemicalElementView createState()=> _ChemicalElementView();

}


class _ChemicalElementView extends State<ChemicalElementView>{

  ChemicalElement element;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map<String,ChemicalElement>;
    element = arguments['ch'];
    return Scaffold(
      backgroundColor: QColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text(element.name, style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 18)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: QColors.PRIMARY_COLOR,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: [
          //carousel images,
          Container(
            height: 170,
            width: 170,
            color: QColors.PRIMARY_TEXT,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: QColors.SELECTED_ITEM
                ),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: QColors.PRIMARY_TEXT
                ),
              ),
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
          SizedBox(height: 50),
          //characteristics
          //history
          Container(
            width: double.infinity,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 13)
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 13)
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo',
                softWrap: true,
                style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 13)
            ),
          ),
        ],
      ),
    );


  }

}