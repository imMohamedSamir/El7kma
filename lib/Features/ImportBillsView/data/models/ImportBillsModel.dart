import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';

class ImportBillsModel {
  String? supplierName;
  String? billNo;
  String? date;
  String? totalAmount;
  String? paid;
  String? rest;
  String? notes;
  List<ImportItemModel>? items;
  ImportBillsModel(
      {this.billNo,
      this.supplierName,
      this.totalAmount,
      this.paid,
      this.rest,
      this.date,
      this.notes,
      this.items});
}
