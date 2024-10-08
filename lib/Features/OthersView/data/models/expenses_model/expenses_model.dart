import 'ExpensesItem.dart';

class ExpensesModel {
  String? id;
  String? invoiceNumber;
  double? totalAmount;
  String? employee;
  String? date;
  String? notes;
  List<ExpensesItem>? items;

  ExpensesModel({
    this.id,
    this.invoiceNumber,
    this.totalAmount,
    this.employee,
    this.date,
    this.notes,
    this.items,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) => ExpensesModel(
        id: json['id'] as String?,
        invoiceNumber: json['invoiceNumber'] as String?,
        totalAmount: json['totalAmount'] as double?,
        employee: json['employee'] as String?,
        date: json['date'] as String,
        notes: json['notes'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => ExpensesItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
