import 'package:hive_flutter/hive_flutter.dart';
part 'expenses_item_model.g.dart';

@HiveType(typeId: 7)
class ExpensesItemModel extends HiveObject {
  @HiveField(0)
  String? expensesName;

  @HiveField(1)
  double? price;

  @HiveField(2)
  int? qty;

  @HiveField(3)
  double? total;

  ExpensesItemModel({
    this.expensesName,
    this.price,
    this.qty,
    this.total,
  });
  Map<String, dynamic> toJson() => {
        "expenseName": expensesName,
        "unitPrice": price,
        "quantity": qty,
        "total": total
      };
}
