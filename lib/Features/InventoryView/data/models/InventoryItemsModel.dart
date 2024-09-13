class Inventoryitemsmodel {
  String? id;
  String? code;
  String? product;
  String? categoryId;
  num? qty;
  num? price;
  bool? isPackage;
  num? packageQty;
  num? unitPrice;
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
