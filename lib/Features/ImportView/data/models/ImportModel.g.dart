// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImportModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportmodelAdapter extends TypeAdapter<Importmodel> {
  @override
  final int typeId = 0;

  @override
  Importmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Importmodel()
      ..userName = fields[0] as String?
      ..supplierName = fields[1] as String?
      ..billNo = fields[2] as String?
      ..totalAmount = fields[3] as double?
      ..paid = fields[4] as double?
      ..rest = fields[5] as double?
      ..items = (fields[6] as List?)?.cast<ImportItemsModel>();
  }

  @override
  void write(BinaryWriter writer, Importmodel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.supplierName)
      ..writeByte(2)
      ..write(obj.billNo)
      ..writeByte(3)
      ..write(obj.totalAmount)
      ..writeByte(4)
      ..write(obj.paid)
      ..writeByte(5)
      ..write(obj.rest)
      ..writeByte(6)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
