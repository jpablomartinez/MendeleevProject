
class ChemicalElement {

  String name;
  String symbol;
  int atomicNumber;
  double density;
  double atomicVolume;
  String oxidationStates;
  double electronegativity;
  double fusionTemperature;
  double boilingTemperature;
  String electronicConfiguration;
  int category;
  double atomicWeight;

  ChemicalElement(
      this.name,
      this.symbol,
      this.atomicNumber,
      this.density,
      this.atomicVolume,
      this.atomicWeight,
      this.oxidationStates,
      this.electronegativity,
      this.fusionTemperature,
      this.boilingTemperature,
      this.electronicConfiguration
  );

  factory ChemicalElement.fromJson(Map<String,dynamic> obj){
    return ChemicalElement(
        obj['name'],
        obj['symbol'],
        obj['atomicNumber'],
        obj['density'].toDouble(),
        obj['atomicVol'].toDouble(),
        obj['atomicWeight'].toDouble(),
        '1,-1',
        obj['electronegativity'].toDouble(),
        obj['tFusion'].toDouble(),
        obj['tBoiling'].toDouble(),
        '1s'
    );
  }


}