import 'package:el7kma/Features/OthersView/data/models/expenses_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'expenses_invoice_model.g.dart';

@HiveType(typeId: 6)
class ExpensesInvoiceModel extends HiveObject {
  @HiveField(0)
  String? billNo;

  @HiveField(1)
  double? totlPrice;

  @HiveField(2)
  String? notes;

  @HiveField(3)
  List<ExpensesItemModel>? items;
  @HiveField(4)
  DateTime? date;

  ExpensesInvoiceModel({
    this.billNo,
    this.totlPrice,
    this.notes,
    this.items,
    this.date,
  });
  Map<String, dynamic> toJson() => {
        "invoiceNumber": billNo,
        "totalAmount": totlPrice,
        "notes": notes,
        "items": (items?.map((e) => e.toJson()).toList())
      };
}
