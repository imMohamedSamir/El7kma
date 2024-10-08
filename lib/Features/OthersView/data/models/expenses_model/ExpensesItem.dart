class ExpensesItem {
  String? id;
  String? expenseName;
  double? unitPrice;
  int? quantity;
  double? total;

  ExpensesItem({
    this.id,
    this.expenseName,
    this.unitPrice,
    this.quantity,
    this.total,
  });

  factory ExpensesItem.fromJson(Map<String, dynamic> json) => ExpensesItem(
        id: json['id'] as String?,
        expenseName: json['expenseName'] as String?,
        unitPrice: json['unitPrice'] as double?,
        quantity: json['quantity'] as int?,
        total: json['total'] as double?,
      );
}
