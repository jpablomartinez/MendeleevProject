import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mendeleev/Components/DigitContainer.dart';
import 'package:mendeleev/Utils/Colors.dart';

class Calculator extends StatefulWidget{

  _Calculator createState()=> _Calculator();

}

class _Calculator extends State<Calculator>{

  final TextEditingController firstField = new TextEditingController();
  final TextEditingController secondField = new TextEditingController();
  FocusNode firstNode = FocusNode();
  FocusNode secondNode = FocusNode();
  bool showDigitError = false;
  bool first = true;
  String temperatureObjective = 'kelvin';
  var temperature = 'celcius';
  List<String> units = ['celcius', 'kelvin', 'fahrenheit'];

  double celciusToKelvin () => double.parse(firstField.text) + 273.15;
  double kelvinToCelcius () => double.parse(firstField.text) - 273.15;
  double celciusToFahrenheit ()=> (double.parse(firstField.text) * 1.8) + 32;
  double fahrenheitToCelcius ()=> (double.parse(firstField.text) - 32)/1.8;
  double fahrenheitToKelvin ()=> fahrenheitToCelcius() + 273.15;
  double kelvinToFahrenheit ()=>  (kelvinToCelcius() * 1.8) + 32;

  void convertTemperature(){
    if(temperatureObjective == 'kelvin'){
      if(temperature == 'celcius') secondField.text = celciusToKelvin().toStringAsFixed(2);
      else if(temperature == 'fahrenheit') secondField.text = fahrenheitToKelvin().toStringAsFixed(2);
    }
    else if(temperatureObjective == 'celcius'){
      if(temperature == 'fahrenheit') secondField.text = fahrenheitToCelcius().toStringAsFixed(2);
      else if(temperature == 'kelvin') secondField.text = kelvinToCelcius().toStringAsFixed(2);
    }
    else if(temperatureObjective == 'fahrenheit'){
      if(temperature == 'celcius') secondField.text = celciusToFahrenheit().toStringAsFixed(2);
      else if(temperature == 'kelvin') secondField.text = kelvinToFahrenheit().toStringAsFixed(2);
    }
  }

  String parseText(String v){
    if(v == 'celcius') return 'Celcius (°C)';
    else if(v == 'kelvin') return 'Kelvin (°K)';
    else return 'Fahrenheit (°F)';
  }

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
    if(first){
      FocusScope.of(context).requestFocus(firstNode);
      first = false;
    }
    return Scaffold(
      backgroundColor: QColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('Calculadora', style: TextStyle(color: QColors.OTHER_TEXT, fontSize: 20)),
        centerTitle: true,
        elevation: 1,
        backgroundColor: QColors.PRIMARY_COLOR,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                  color: QColors.PRIMARY_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0,1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]
              ),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 50,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: QColors.PRIMARY_COLOR
                      ),
                      child: DropdownButton<String>(
                          value: temperature,
                          isExpanded: true,
                          icon: Icon(Icons.arrow_drop_down, color: QColors.PRIMARY_TEXT),
                          underline: Container(),
                          style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 10),
                          iconSize: 20,
                          elevation: 16,
                          onChanged: (String newValue){
                            if(newValue != temperatureObjective){
                              setState(() {
                                temperature = newValue;
                              });
                              if(firstField.text != '') convertTemperature();
                            }
                          },
                          items: units
                              .map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(parseText(value), style: TextStyle(color: value == temperatureObjective ? QColors.SECONDARY_TEXT : QColors.PRIMARY_TEXT))
                            );
                          }).toList()
                      )
                    )
                  ),
                  Container(
                      width: 185,
                      child: TextField(
                        controller: firstField,
                        focusNode: firstNode,
                        textAlign: TextAlign.end,
                        enabled: true,
                        readOnly: true,
                        showCursor: true,
                        style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 18),
                        cursorColor: QColors.SELECTED,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      )
                  ),
                ],
              )
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                  color: QColors.PRIMARY_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0,1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]
              ),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 50,
                    child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: QColors.PRIMARY_COLOR
                        ),
                        child: DropdownButton<String>(
                            value: temperatureObjective,
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down, color: QColors.PRIMARY_TEXT),
                            underline: Container(),
                            style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 10),
                            iconSize: 20,
                            elevation: 16,
                            onChanged: (String newValue){
                              if(newValue != temperature){
                                setState(() {
                                  temperatureObjective = newValue;
                                });
                                if(firstField.text != '') convertTemperature();
                              }
                            },
                            items: units
                                .map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(parseText(value), style: TextStyle(color: value == temperature ? QColors.SECONDARY_TEXT : QColors.PRIMARY_TEXT))
                              );
                            }).toList()
                        )
                    )
                  ),
                  Container(
                    width: 185,
                    child: TextField(
                      controller: secondField,
                      focusNode: secondNode,
                      textAlign: TextAlign.end,
                      enabled: true,
                      readOnly: true,
                      style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 18),
                      cursorColor: QColors.SELECTED,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )
                  ),
                ],
              )
            ),
            SizedBox(height: 15),
            Container(
              child: Text(showDigitError ? 'No puede ingresar más de 12 dígitos' : '', style: TextStyle(color: Color(0xffa42c2c), fontSize: 13)),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '7';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '7'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '4';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '4'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '1';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '1'
                    ),
                    DigitContainer(
                        function: (){
                          if(firstField.text != ''){
                            double v = double.parse(firstField.text);
                            firstField.text = '${v*-1}';
                            if(secondField.text != '') convertTemperature() ;
                          }
                        },
                        digit: '+/-'
                    ),
                  ],
                ),
                Column(
                  children: [
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '8';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '8'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '5';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '5'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '2';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '2'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '0';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '0'
                    ),
                  ],
                ),
                Column(
                  children: [
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '9';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '9'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '6';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '6'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(r.length < 12) firstField.text = r + '3';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: '3'
                    ),
                    DigitContainer(
                        function: (){
                          String r = firstField.text;
                          if(!r.contains(',') && r.length < 11) firstField.text = r + ',';
                          else {
                            setState(() {
                              showDigitError = true;
                            });
                          }
                        },
                        digit: ','
                    ),
                  ],
                ),
                Column(
                  children: [
                    DigitContainer(
                        longPressFunction: (){
                          firstField.text = '';
                          secondField.text = '';
                        },
                        function: (){
                          String r = firstField.text;
                          if(r.length >= 1){
                            String tmp = r.substring(0, r.length - 1);
                            firstField.text = tmp;
                            secondField.text = '';
                          }
                          if(r.length == 12){
                            setState(() {
                              showDigitError = false;
                            });
                          }
                        },
                        digit: '',
                        icon: true
                    ),
                    DigitContainer(
                        function: (){
                          firstField.text = '';
                          secondField.text = '';
                        },
                        digit: 'C'
                    ),
                    DigitContainer(function: (){}, digit: '?'),
                    DigitContainer(
                        function: () => convertTemperature(),
                        digit: '='
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(8),
              height: 120,
              decoration: BoxDecoration(
                  color: QColors.PRIMARY_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0,1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('¿Sabias qué?', style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12)),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing'
                    'elit, sed do eiusmod tempor incididunt ut labore et'
                    'dolore magna aliqua. Ut enim ad minim veniam,'
                    'quis nostrud exercitation ullamco laboris nisi ',
                      style: TextStyle(color: QColors.PRIMARY_TEXT, fontSize: 12))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}