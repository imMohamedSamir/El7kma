import 'package:hive/hive.dart';

part 'product_detail.g.dart'; // Required for code generation

@HiveType(typeId: 0) // Assign a unique typeId for the adapter
class ProductDetail {
  @HiveField(0)
  String? productCode;

  @HiveField(1)
  String? productName;

  @HiveField(2)
  double? unitPrice;

  @HiveField(3)
  int? quantity;

  @HiveField(4)
  double? totalPrice;

  @HiveField(5)
  int? packageQuantity;

  @HiveField(6)
  bool? isPackaged;

  ProductDetail({
    this.productCode,
    this.productName,
    this.unitPrice,
    this.quantity,
    this.totalPrice,
    this.packageQuantity,
    this.isPackaged,
  });

  Map<String, dynamic> toJson() => {
        'productCode': productCode,
        'productName': productName,
        'unitPrice': unitPrice,
        'quantity': quantity,
        'totalPrice': totalPrice,
        'packageQuantity': packageQuantity,
        'isPackaged': isPackaged,
      };
}
