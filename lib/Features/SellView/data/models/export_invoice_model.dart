import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:hive/hive.dart';

part 'export_invoice_model.g.dart'; // Generate this file using Hive's code generator

@HiveType(typeId: 3)
class ExportInvoiceModel {
  @HiveField(0)
  String? billNo;

  @HiveField(1)
  String? notes;

  @HiveField(2)
  String? customerId;

  @HiveField(3)
  DateTime? date;

  @HiveField(4)
  double? totalPrice;

  @HiveField(5)
  double? paid;

  @HiveField(6)
  double? rest;

  @HiveField(7)
  double? discount;

  @HiveField(8)
  List<ExportItemModel>? items;

  ExportInvoiceModel({
    this.billNo,
    this.notes,
    this.customerId,
    this.date,
    this.totalPrice,
    this.paid,
    this.rest,
    this.discount,
    this.items,
  });
  Map<String, dynamic> toJson() => {
        'receiptNumber': billNo,
        'customerId': customerId,
        'paymentDate': date?.toIso8601String(),
        'totalAmount': totalPrice,
        'amountPaid': paid,
        'amountDue': rest,
        'discount': discount,
        'notes': notes,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
