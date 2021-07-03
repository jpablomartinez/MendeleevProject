import 'package:hive/hive.dart';

part 'ChemicalElement.g.dart';

@HiveType(typeId: 0)
class ChemicalElement extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final int atomicNumber;
  @HiveField(3)
  final double atomicWeight;
  @HiveField(4)
  final double density;
  @HiveField(5)
  final double atomicVol;
  @HiveField(6)
  final String oxidationStates;
  @HiveField(7)
  final double electronegativity;
  @HiveField(8)
  final double tFusion;
  @HiveField(9)
  final double tBoiling;
  @HiveField(10)
  final String electronicConfiguration;
  @HiveField(11)
  final int category;

  ChemicalElement({
    this.name,
    this.symbol,
    this.atomicNumber,
    this.atomicWeight,
    this.density,
    this.atomicVol,
    this.oxidationStates,
    this.electronegativity,
    this.tFusion,
    this.tBoiling,
    this.electronicConfiguration,
    this.category
  });

  factory ChemicalElement.fromJson(Map<dynamic, dynamic> obj){
    return ChemicalElement(
        name: obj['name'],
        symbol: obj['symbol'],
        atomicNumber: obj['atomicNumber'],
        atomicWeight: obj['atomicWeight'].toDouble(),
        density: obj['density'].toDouble(),
        atomicVol: obj['atomicVol'].toDouble(),
        oxidationStates: obj['os'],
        electronegativity: obj['electronegativity'].toDouble(),
        tFusion: obj['tFusion'].toDouble(),
        tBoiling: obj['tBoiling'].toDouble(),
        electronicConfiguration: obj['ce'],
        category: obj['category']
    );
  }
  @override
  String toString(){
    return '$name \n $symbol';
  }
}

