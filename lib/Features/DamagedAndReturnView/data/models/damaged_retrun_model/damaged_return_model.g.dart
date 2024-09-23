// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damaged_return_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DamagedRetrunModelAdapter extends TypeAdapter<DamagedRetrunModel> {
  @override
  final int typeId = 8;

  @override
  DamagedRetrunModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DamagedRetrunModel(
      type: fields[0] as String?,
      invoiceNumber: fields[1] as int?,
      totalAmount: fields[2] as double?,
      notes: fields[3] as String?,
      items: (fields[4] as List?)?.cast<DamagedReturnItemModel>(),
      date: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DamagedRetrunModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.invoiceNumber)
      ..writeByte(2)
      ..write(obj.totalAmount)
      ..writeByte(3)
      ..write(obj.notes)
      ..writeByte(4)
      ..write(obj.items)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DamagedRetrunModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
