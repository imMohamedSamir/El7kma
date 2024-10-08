import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_item_model.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_model.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_item_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> openHiveBox() async {
  await Hive.openBox<AddSupplierInvoiceModel>(supplierInvoices);
  await Hive.openBox<ProductDetail>(productDetails);
  await Hive.openBox<ExportInvoiceModel>(kExportInvoices);
  await Hive.openBox<ExportItemModel>(kExportItems);
  await Hive.openBox<Inventoryitemsmodel>(kInventoryItems);
  await Hive.openBox<ExpensesInvoiceModel>(kExpensesInvoce);
  await Hive.openBox<ExpensesItemModel>(kExpensesItem);
  await Hive.openBox<DamagedRetrunModel>(kdamagedRetrunInvoice);
  await Hive.openBox<DamagedReturnItemModel>(kdamagedRetrunItem);
}
