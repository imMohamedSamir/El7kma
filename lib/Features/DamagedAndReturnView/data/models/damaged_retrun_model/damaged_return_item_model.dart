import 'package:hive/hive.dart';
part 'damaged_return_item_model.g.dart';

@HiveType(typeId: 9)
class DamagedReturnItemModel {
  @HiveField(0)
  String? productCode;

  @HiveField(1)
  String? productName;

  @HiveField(2)
  double? unitPrice;

  @HiveField(3)
  int? quantity;

  @HiveField(4)
  double? total;

  DamagedReturnItemModel({
    this.productCode,
    this.productName,
    this.unitPrice,
    this.quantity,
    this.total,
  });

  Map<String, dynamic> toJson() => {
        'productCode': productCode,
        'productName': productName,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'total': total,
      };
}
