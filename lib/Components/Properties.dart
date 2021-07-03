import 'package:flutter/material.dart';
import 'package:mendeleev/Components/Characteristic.dart';
import 'package:mendeleev/DB/ChemicalElement.dart';

class Properties extends StatelessWidget {

  final ChemicalElement element;

  Properties({@required this.element});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Characteristic(name:'Volumen: ', value: '${element.atomicVol}'),
            Characteristic(name:'Densidad: ', value: '${element.density}'),
            Characteristic(name:'Peso atómico: ', value: '${element.atomicWeight}'),
            Characteristic(name:'T° Fusión (C ): ', value: '${element.tFusion}'),
            Characteristic(name:'T° Ebullisión (C): ', value: '${element.tBoiling}'),
            Characteristic(name:'Electronegatividad: ', value: '${element.electronegativity}'),
            Characteristic(name:'Estados de oxidación: ', value: element.oxidationStates),
            Characteristic(name:'Configuración electrónica: ', value: element.electronicConfiguration),
          ],
        ),
      ],
    );
  }

}