import 'package:hive/hive.dart';

part 'ImportItemsModel.g.dart';

@HiveType(typeId: 1)
class ImportItemsModel extends HiveObject {
  @HiveField(0)
  String? productCode;

  @HiveField(1)
  String? productName;

  @HiveField(2)
  double? unitPrice;

  @HiveField(3)
  double? totalPrice;

  @HiveField(4)
  int? productQty;

  @HiveField(5)
  int? packageQty;
}
