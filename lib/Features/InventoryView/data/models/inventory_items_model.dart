import 'package:hive/hive.dart';

part 'inventory_items_model.g.dart';

@HiveType(typeId: 2)
class Inventoryitemsmodel {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? code;

  @HiveField(2)
  String? product;

  @HiveField(3)
  num? qty;

  @HiveField(4)
  num? price;

  @HiveField(5)
  bool? isPackage;

  @HiveField(6)
  num? packageQty;

  @HiveField(7)
  num? unitPrice;

  @HiveField(8)
  bool? isDiscount;
  Inventoryitemsmodel({
    this.id,
    this.code,
    this.product,
    this.qty,
    this.price,
    this.isPackage,
    this.packageQty,
    this.unitPrice,
    this.isDiscount = false,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'itemName': product,
        'stockQuantity': qty,
        'price': price,
        'isPackaged': isPackage,
        'packageQuantity': packageQty,
        'unitPrice': unitPrice,
        'isDiscontinued': isDiscount
      };

  factory Inventoryitemsmodel.fromJson(Map<String, dynamic> json) {
    return Inventoryitemsmodel(
      id: json['itemId'] as String,
      code: json['code'] as String,
      product: json['itemName'] as String,
      qty: json['stockQuantity'] as num,
      price: json['price'] as num,
      isPackage: json['isPackaged'] as bool,
      packageQty: json['packageQuantity'],
      unitPrice: json['unitPrice'] as num,
    );
  }
}
