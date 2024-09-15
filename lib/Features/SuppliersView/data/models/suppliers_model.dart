class SuppliersModel {
  String? supplierId;
  String? supplierName;
  String? contactInfo;
  double? totalAmount;
  double? rest;
  double? paid;

  SuppliersModel(
      {this.supplierId,
      this.supplierName,
      this.contactInfo,
      this.totalAmount,
      this.paid,
      this.rest});

  factory SuppliersModel.fromJson(Map<String, dynamic> json) {
    return SuppliersModel(
      supplierId: json['supplierId'] as String?,
      supplierName: json['supplierName'] as String?,
      contactInfo: json['contactInfo'] as String?,
      totalAmount: json['totalAmount'] as double?,
      rest: json['rest'] as double?,
      paid: json['paid'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'supplierName': supplierName,
        'contactInfo': contactInfo,
      };
}
