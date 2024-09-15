// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDetailAdapter extends TypeAdapter<ProductDetail> {
  @override
  final int typeId = 0;

  @override
  ProductDetail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDetail(
      productCode: fields[0] as String?,
      productName: fields[1] as String?,
      unitPrice: fields[2] as double?,
      quantity: fields[3] as int?,
      totalPrice: fields[4] as double?,
      packageQuantity: fields[5] as int?,
      isPackaged: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDetail obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.productCode)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.unitPrice)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.totalPrice)
      ..writeByte(5)
      ..write(obj.packageQuantity)
      ..writeByte(6)
      ..write(obj.isPackaged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDetailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
