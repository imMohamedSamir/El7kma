import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:hive/hive.dart';

Future<void> callHiveAdapters() async {
  Hive.registerAdapter(AddSupplierInvoiceModelAdapter());
  Hive.registerAdapter(ProductDetailAdapter());
  Hive.registerAdapter(ExportInvoiceModelAdapter());
  Hive.registerAdapter(ExportItemModelAdapter());
  Hive.registerAdapter(InventoryitemsmodelAdapter());
}
