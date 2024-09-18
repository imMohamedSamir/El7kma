// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExportItemModelAdapter extends TypeAdapter<ExportItemModel> {
  @override
  final int typeId = 4;

  @override
  ExportItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExportItemModel(
      code: fields[0] as String?,
      product: fields[1] as String?,
      quantity: fields[2] as int?,
      unitPrice: fields[3] as double?,
      totalPrice: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ExportItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.product)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.unitPrice)
      ..writeByte(4)
      ..write(obj.totalPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExportItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
