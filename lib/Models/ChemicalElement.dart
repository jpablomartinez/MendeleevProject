
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

  ChemicalElement(var obj){
    this.name = obj['name'];
    this.symbol = obj['symbol'];
    this.atomicNumber = obj['atomicNumber'];
    this.density = obj['density'].toDouble();
    this.atomicVolume = obj['atomicVol'].toDouble();
    this.atomicWeight = obj['atomicWeight'].toDouble();
    this.oxidationStates = '1,-1';
    this.electronegativity = obj['electronegativity'].toDouble();
    this.fusionTemperature = obj['tFusion'].toDouble();
    this.boilingTemperature = obj['tBoiling'].toDouble();
    this.electronicConfiguration = '1s';
    this.category = obj['category'];
  }

  @override
  String toString(){
    return '$name \n $symbol';
  }


}