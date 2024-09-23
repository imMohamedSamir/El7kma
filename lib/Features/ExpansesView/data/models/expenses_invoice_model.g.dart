// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_invoice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesInvoiceModelAdapter extends TypeAdapter<ExpensesInvoiceModel> {
  @override
  final int typeId = 6;

  @override
  ExpensesInvoiceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesInvoiceModel(
      billNo: fields[0] as String?,
      totlPrice: fields[1] as double?,
      notes: fields[2] as String?,
      items: (fields[3] as List?)?.cast<ExpensesItemModel>(),
      date: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesInvoiceModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.billNo)
      ..writeByte(1)
      ..write(obj.totlPrice)
      ..writeByte(2)
      ..write(obj.notes)
      ..writeByte(3)
      ..write(obj.items)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesInvoiceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
