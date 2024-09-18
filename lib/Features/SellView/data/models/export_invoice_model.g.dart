// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_invoice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExportInvoiceModelAdapter extends TypeAdapter<ExportInvoiceModel> {
  @override
  final int typeId = 3;

  @override
  ExportInvoiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExportInvoiceModel(
      billNo: fields[0] as String?,
      notes: fields[1] as String?,
      customerId: fields[2] as String?,
      date: fields[3] as DateTime?,
      totalPrice: fields[4] as double?,
      paid: fields[5] as double?,
      rest: fields[6] as double?,
      discount: fields[7] as double?,
      items: (fields[8] as List?)?.cast<ExportItemModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ExportInvoiceModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.billNo)
      ..writeByte(1)
      ..write(obj.notes)
      ..writeByte(2)
      ..write(obj.customerId)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.totalPrice)
      ..writeByte(5)
      ..write(obj.paid)
      ..writeByte(6)
      ..write(obj.rest)
      ..writeByte(7)
      ..write(obj.discount)
      ..writeByte(8)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExportInvoiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
