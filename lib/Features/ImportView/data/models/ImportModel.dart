import 'package:el7kma/Features/ImportView/data/models/ImportItemsModel.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'ImportModel.g.dart';

@HiveType(typeId: 0)
class Importmodel extends HiveObject {
  @HiveField(0)
  String? userName;

  @HiveField(1)
  String? supplierName;

  @HiveField(2)
  String? billNo;

  @HiveField(3)
  double? totalAmount;

  @HiveField(4)
  double? paid;

  @HiveField(5)
  double? rest;

  @HiveField(6)
  List<ImportItemsModel>? items;
}
