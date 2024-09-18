import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:hive/hive.dart';

abstract class InventoryLocalSource {
  List<Inventoryitemsmodel> getItems(
      {String code, String name, int pageNumber});
}

class ImplInventoryLocalSource extends InventoryLocalSource {
  @override
  List<Inventoryitemsmodel> getItems(
      {String? code, String? name, int? pageNumber}) {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);
    List<Inventoryitemsmodel> items = box.values.toList();
    return items;
  }
}
