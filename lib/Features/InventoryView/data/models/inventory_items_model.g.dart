// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_items_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InventoryitemsmodelAdapter extends TypeAdapter<Inventoryitemsmodel> {
  @override
  final int typeId = 2;

  @override
  Inventoryitemsmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Inventoryitemsmodel(
      id: fields[0] as String?,
      code: fields[1] as String?,
      product: fields[2] as String?,
      qty: fields[3] as num?,
      price: fields[4] as num?,
      isPackage: fields[5] as bool?,
      packageQty: fields[6] as num?,
      unitPrice: fields[7] as num?,
      isDiscount: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Inventoryitemsmodel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.code)
      ..writeByte(2)
      ..write(obj.product)
      ..writeByte(3)
      ..write(obj.qty)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.isPackage)
      ..writeByte(6)
      ..write(obj.packageQty)
      ..writeByte(7)
      ..write(obj.unitPrice)
      ..writeByte(8)
      ..write(obj.isDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InventoryitemsmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
