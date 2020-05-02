
class Element {

  String _name;
  String _symbol;
  int _atomicNumber;
  double _density;
  double _atomicVolume;
  List<int> _oxidationStates;
  double _electronegativity;
  double _fusionTemperature;
  double _boilingTemperature;
  List<String> _electronicConfiguration;
  int _category;

  get category => _category;

  set category(value){
    _category = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get symbol => _symbol;

  get electronicConfiguration => _electronicConfiguration;

  set electronicConfiguration(value) {
    _electronicConfiguration = value;
  }

  get boilingTemperature => _boilingTemperature;

  set boilingTemperature(value) {
    _boilingTemperature = value;
  }

  get fusionTemperature => _fusionTemperature;

  set fusionTemperature(value) {
    _fusionTemperature = value;
  }

  get electronegativity => _electronegativity;

  set electronegativity(value) {
    _electronegativity = value;
  }

  get oxidationStates => _oxidationStates;

  set oxidationStates(value) {
    _oxidationStates = value;
  }

  get atomicVolume => _atomicVolume;

  set atomicVolume(value) {
    _atomicVolume = value;
  }

  get density => _density;

  set density(value) {
    _density = value;
  }

  get atomicNumber => _atomicNumber;

  set atomicNumber(value) {
    _atomicNumber = value;
  }

  set symbol(value) {
    _symbol = value;
  }

  Element(this._name, this._symbol, this._atomicNumber, this._density,
      this._atomicVolume, this._oxidationStates, this._electronegativity,
      this._fusionTemperature, this._boilingTemperature,
      this._electronicConfiguration);


}