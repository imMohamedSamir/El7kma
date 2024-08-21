class ExportBillModel {
  String? userName;
  String? customerName;
  String? billNo;
  String? date;
  String? totalAmount;
  List<ExprotItemModel>? items;

  ExportBillModel(
      {this.userName,
      this.billNo,
      this.customerName,
      this.date,
      this.totalAmount,
      this.items});
}

class ExprotItemModel {
  String? code;
  String? product;
  String? price;
  String? qty;
  String? totalprice;
  ExprotItemModel(
      {this.code, this.product, this.price, this.qty, this.totalprice});
}
