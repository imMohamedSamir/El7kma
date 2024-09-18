class ExportBillModel {
  String? id;
  String? userName;
  String? customerName;
  String? billNo;
  String? date;
  String? notes;
  double? totalAmount;
  double? paid;
  double? rest;
  double? discount;

  List<ExprotItemModel>? items;

  ExportBillModel(
      {this.id,
      this.userName,
      this.billNo,
      this.customerName,
      this.date,
      this.notes,
      this.totalAmount,
      this.paid,
      this.rest,
      this.discount,
      this.items});
  factory ExportBillModel.fromJson(Map<String, dynamic> json) {
    return ExportBillModel(
      id: json['saleId'] as String?,
      billNo: json['receiptNumber'] as String?,
      date: json['paymentDate'] as String?,
      customerName: json['customerName'] as String?,
      userName: json['employeeName'] as String?,
      totalAmount: json['totalAmount'] as double?,
      paid: json['amountPaid'] as double?,
      rest: json['amountDue'] as double?,
      discount: json['discount'] as double?,
      notes: json['notes'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ExprotItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class ExprotItemModel {
  String? code;
  String? product;
  double? price;
  int? qty;
  num? totalprice;
  ExprotItemModel(
      {this.code, this.product, this.price, this.qty, this.totalprice});
  factory ExprotItemModel.fromJson(Map<String, dynamic> json) {
    return ExprotItemModel(
      code: json['code'] as String?,
      product: json['itemName'] as String?,
      price: json['unitPrice'] as double?,
      qty: json['quantity'] as int?,
      totalprice: json['totalPrice'] as num?,
    );
  }
}
