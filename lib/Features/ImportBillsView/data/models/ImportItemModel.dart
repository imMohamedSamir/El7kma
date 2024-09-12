class ImportItemModel {
  String? code;
  String? product;
  String? price;
  String? qty;
  String? totalprice;
  bool package;
  String? packageQty;
  ImportItemModel(
      {this.code,
      this.product,
      this.price,
      this.qty,
      this.totalprice,
      this.package = false,
      this.packageQty});
}
