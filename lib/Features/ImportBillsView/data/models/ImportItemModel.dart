class ImportItemModel {
  String? code;
  String? product;
  double? price;
  int? qty;
  double? totalprice;
  bool? package;
  int? packageQty;
  ImportItemModel(
      {this.code,
      this.product,
      this.price,
      this.qty,
      this.totalprice,
      this.package = false,
      this.packageQty});
  factory ImportItemModel.fromJson(Map<String, dynamic> json) {
    return ImportItemModel(
      code: json['productCode'] as String?,
      product: json['productName'] as String?,
      price: json['unitPrice'] as double?,
      qty: json['quantity'] as int?,
      totalprice: json['totalPrice'] as double?,
      package: json['isPackaged'] as bool?,
      packageQty: json['packageQuantity'] as int?,
    );
  }
}
