class AddCustomerModel {
  String? name;
  String? phoneNumber;
  String? email;
  String? address;
  num? debtAmount;
  DateTime? lastPurchaseDate;

  AddCustomerModel({
    this.name,
    this.phoneNumber,
    this.email,
    this.address,
    this.debtAmount,
    this.lastPurchaseDate,
  });

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) {
    return AddCustomerModel(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      debtAmount: json['debtAmount'] as double?,
      lastPurchaseDate: json['lastPurchaseDate'] == null
          ? null
          : DateTime.parse(json['lastPurchaseDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'address': address,
        'debtAmount': debtAmount,
        'lastPurchaseDate': lastPurchaseDate?.toIso8601String(),
      };
}
