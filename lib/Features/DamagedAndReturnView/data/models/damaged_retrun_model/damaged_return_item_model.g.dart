// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damaged_return_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DamagedReturnItemModelAdapter
    extends TypeAdapter<DamagedReturnItemModel> {
  @override
  final int typeId = 9;

  @override
  DamagedReturnItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DamagedReturnItemModel(
      productCode: fields[0] as String?,
      productName: fields[1] as String?,
      unitPrice: fields[2] as double?,
      quantity: fields[3] as int?,
      total: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DamagedReturnItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productCode)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DamagedReturnItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
