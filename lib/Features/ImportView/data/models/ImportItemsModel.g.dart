// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ImportItemsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImportItemsModelAdapter extends TypeAdapter<ImportItemsModel> {
  @override
  final int typeId = 1;

  @override
  ImportItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImportItemsModel()
      ..productCode = fields[0] as String?
      ..productName = fields[1] as String?
      ..unitPrice = fields[2] as double?
      ..totalPrice = fields[3] as double?
      ..productQty = fields[4] as int?
      ..packageQty = fields[5] as int?;
  }

  @override
  void write(BinaryWriter writer, ImportItemsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.productCode)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.totalPrice)
      ..writeByte(4)
      ..write(obj.productQty)
      ..writeByte(5)
      ..write(obj.packageQty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImportItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
