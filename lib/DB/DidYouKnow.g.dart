// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DidYouKnow.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DidYouKnowAdapter extends TypeAdapter<DidYouKnow> {
  @override
  final int typeId = 2;

  @override
  DidYouKnow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DidYouKnow(
      amount: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DidYouKnow obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DidYouKnowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
