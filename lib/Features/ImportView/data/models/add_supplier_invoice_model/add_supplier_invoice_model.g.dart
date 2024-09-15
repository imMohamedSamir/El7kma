// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_supplier_invoice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddSupplierInvoiceModelAdapter
    extends TypeAdapter<AddSupplierInvoiceModel> {
  @override
  final int typeId = 1;

  @override
  AddSupplierInvoiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddSupplierInvoiceModel(
      invoiceNumber: fields[0] as String?,
      supplierid: fields[1] as String?,
      date: fields[2] as DateTime?,
      totalAmount: fields[3] as double?,
      paidAmount: fields[4] as double?,
      remainingAmount: fields[5] as double?,
      productDetails: (fields[6] as List?)?.cast<ProductDetail>(),
      notes: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AddSupplierInvoiceModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.invoiceNumber)
      ..writeByte(1)
      ..write(obj.supplierid)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.totalAmount)
      ..writeByte(4)
      ..write(obj.paidAmount)
      ..writeByte(5)
      ..write(obj.remainingAmount)
      ..writeByte(6)
      ..write(obj.productDetails)
      ..writeByte(7)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddSupplierInvoiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
