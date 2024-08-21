class Inventoryitemsmodel {
  String? code;
  String? product;
  int? qty;
  double? price;
  bool? isPackage;
  int? packageQty;
  double? unitPrice;

  Inventoryitemsmodel({
    this.code,
    this.product,
    this.qty,
    this.price,
    this.isPackage,
    this.packageQty,
    this.unitPrice,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'product': product,
        'qty': qty,
        'price': price,
        'isPackage': isPackage,
        'packageQty': packageQty,
        'unitPrice': unitPrice,
      };
  Inventoryitemsmodel copyWith({
    String? code,
    String? product,
    int? qty,
    double? price,
    bool? isPackage,
    int? packageQty,
    double? unitPrice,
  }) {
    return Inventoryitemsmodel(
      code: code ?? this.code,
      product: product ?? this.product,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      isPackage: isPackage ?? this.isPackage,
      packageQty: packageQty ?? this.packageQty,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  factory Inventoryitemsmodel.fromJson(Map<String, dynamic> json) {
    return Inventoryitemsmodel(
      code: json['code'],
      product: json['product'],
      qty: json['qty'],
      price: json['price'],
      isPackage: json['isPackage'],
      packageQty: json['packageQty'],
      unitPrice: json['unitPrice'],
    );
  }
}
