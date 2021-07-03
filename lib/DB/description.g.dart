// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'description.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DescriptionAdapter extends TypeAdapter<Description> {
  @override
  final int typeId = 1;

  @override
  Description read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Description(
      atomicNumber: fields[0] as String,
      history: fields[1] as String,
      uses: fields[2] as String,
      bib: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Description obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.atomicNumber)
      ..writeByte(1)
      ..write(obj.history)
      ..writeByte(2)
      ..write(obj.uses)
      ..writeByte(3)
      ..write(obj.bib);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DescriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
