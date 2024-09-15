class CustomerModel {
  String? id;

  String? customerName;
  String? customerPhone;
  String? total;
  String? paid;
  String? rest;

  CustomerModel(
      {this.id,
      this.customerName,
      this.customerPhone,
      this.paid,
      this.total,
      this.rest});
  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['customerId'] as String?,
      customerName: json['name'] as String?,
      customerPhone: json['phoneNumber'] as String?,
    );
  }
}
