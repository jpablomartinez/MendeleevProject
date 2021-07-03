// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChemicalElement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChemicalElementAdapter extends TypeAdapter<ChemicalElement> {
  @override
  final int typeId = 0;

  @override
  ChemicalElement read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChemicalElement(
      name: fields[0] as String,
      symbol: fields[1] as String,
      atomicNumber: fields[2] as int,
      atomicWeight: fields[3] as double,
      density: fields[4] as double,
      atomicVol: fields[5] as double,
      oxidationStates: fields[6] as String,
      electronegativity: fields[7] as double,
      tFusion: fields[8] as double,
      tBoiling: fields[9] as double,
      electronicConfiguration: fields[10] as String,
      category: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ChemicalElement obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.atomicNumber)
      ..writeByte(3)
      ..write(obj.atomicWeight)
      ..writeByte(4)
      ..write(obj.density)
      ..writeByte(5)
      ..write(obj.atomicVol)
      ..writeByte(6)
      ..write(obj.oxidationStates)
      ..writeByte(7)
      ..write(obj.electronegativity)
      ..writeByte(8)
      ..write(obj.tFusion)
      ..writeByte(9)
      ..write(obj.tBoiling)
      ..writeByte(10)
      ..write(obj.electronicConfiguration)
      ..writeByte(11)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChemicalElementAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
