import 'package:hive/hive.dart';
import 'product_detail.dart';

part 'add_supplier_invoice_model.g.dart';

@HiveType(typeId: 1)
class AddSupplierInvoiceModel {
  @HiveField(0)
  String? invoiceNumber;

  @HiveField(1)
  String? supplierid;

  @HiveField(2)
  DateTime? date;

  @HiveField(3)
  double? totalAmount;

  @HiveField(4)
  double? paidAmount;

  @HiveField(5)
  double? remainingAmount;

  @HiveField(6)
  List<ProductDetail>? productDetails;

  @HiveField(7)
  String? notes;

  AddSupplierInvoiceModel({
    this.invoiceNumber,
    this.supplierid,
    this.date,
    this.totalAmount,
    this.paidAmount,
    this.remainingAmount,
    this.productDetails,
    this.notes = "",
  });

  Map<String, dynamic> toJson() => {
        'invoiceNumber': invoiceNumber,
        'supplierid': supplierid,
        'date': date?.toIso8601String(),
        'totalAmount': totalAmount,
        'paidAmount': paidAmount,
        'remainingAmount': remainingAmount,
        'productDetails': productDetails?.map((e) => e.toJson()).toList(),
        'notes': notes,
      };
}
