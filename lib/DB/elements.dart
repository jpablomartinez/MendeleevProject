import 'package:hive/hive.dart';

@HiveType()
class Elements extends HiveObject{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String symbol;
  @HiveField(2)
  final double atomicNumber;
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
  @HiveField(7)
  final double tFusion;
  @HiveField(8)
  final double tBoiling;
  //@HiveField(10)
  //final String electronicConfiguration;
  /*@HiveField(11)
  final String history;
  @HiveField(12)
  final String uses;
  @HiveField(13)
  final String imagesPath;*/

  Elements(this.name, this.symbol, this.atomicNumber, this.atomicWeight,
      this.density, this.atomicVol, this.oxidationStates,
      this.electronegativity, this.tFusion, this.tBoiling,
  );

}

