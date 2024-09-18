import 'package:hive/hive.dart';
part 'export_item_model.g.dart';

@HiveType(typeId: 4)
class ExportItemModel {
  @HiveField(0)
  String? code;

  @HiveField(1)
  String? product;

  @HiveField(2)
  int? quantity;

  @HiveField(3)
  double? unitPrice;

  @HiveField(4)
  double? totalPrice;

  ExportItemModel({
    this.code,
    this.product,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'itemName': product,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'totalPrice': totalPrice,
      };
}
