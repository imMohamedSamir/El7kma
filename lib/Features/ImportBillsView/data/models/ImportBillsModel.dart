import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';

class ImportBillsModel {
  String? id;
  String? supplierName;
  String? billNo;
  String? date;
  double? totalAmount;
  double? paid;
  double? rest;
  String? notes;
  List<ImportItemModel>? items;
  ImportBillsModel(
      {this.id,
      this.billNo,
      this.supplierName,
      this.totalAmount,
      this.paid,
      this.rest,
      this.date,
      this.notes,
      this.items});
  factory ImportBillsModel.fromJson(Map<String, dynamic> json) {
    return ImportBillsModel(
      id: json['supplierInvoiceId'] as String?,
      billNo: json['invoiceNumber'] as String?,
      date: json['date'] as String?,
      supplierName: json['supplierName'] as String?,
      totalAmount: json['totalAmount'] as double?,
      paid: json['paidAmount'] as double?,
      rest: json['remainingAmount'] as double?,
      notes: json['notes'] as String?,
      items: (json['productDetails'] as List<dynamic>?)
          ?.map((e) => ImportItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
