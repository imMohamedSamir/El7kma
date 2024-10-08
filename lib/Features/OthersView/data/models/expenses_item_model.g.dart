// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesItemModelAdapter extends TypeAdapter<ExpensesItemModel> {
  @override
  final int typeId = 7;

  @override
  ExpensesItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExpensesItemModel(
      expensesName: fields[0] as String?,
      price: fields[1] as double?,
      qty: fields[2] as int?,
      total: fields[3] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ExpensesItemModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.expensesName)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.qty)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
