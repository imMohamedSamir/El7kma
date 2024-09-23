import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_item_model.dart';
import 'package:hive/hive.dart';
part 'damaged_return_model.g.dart';

@HiveType(typeId: 8)
class DamagedRetrunModel {
  @HiveField(0)
  String? type;

  @HiveField(1)
  int? invoiceNumber;

  @HiveField(2)
  double? totalAmount;

  @HiveField(3)
  String? notes;

  @HiveField(4)
  List<DamagedReturnItemModel>? items;
  @HiveField(5)
  DateTime? date;

  DamagedRetrunModel(
      {this.type,
      this.invoiceNumber,
      this.totalAmount,
      this.notes,
      this.items,
      this.date});

  Map<String, dynamic> toJson() => {
        'type': type,
        'invoiceNumber': invoiceNumber,
        'totalAmount': totalAmount,
        'notes': notes,
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
