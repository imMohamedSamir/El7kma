import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> openHiveBox() async {
  await Hive.openBox<AddSupplierInvoiceModel>(supplierInvoices);
  await Hive.openBox<ProductDetail>(productDetails);
}
