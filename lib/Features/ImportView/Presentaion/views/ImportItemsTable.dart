import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemDefult.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemRowSec.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ImportItemsTable extends StatelessWidget {
  const ImportItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Column(children: [
          ...List.generate(getLength(box),
              (index) => ImportItemDefult(product: getItems(box)[index])),
          const ImportItemDefult(),
        ]);
      },
    );
  }

  List<ProductDetail> getItems(Box<AddSupplierInvoiceModel> box) {
    if (box.isEmpty) {
      return [];
    } else {
      return box.values.first.productDetails ?? [];
    }
  }

  int getLength(Box<AddSupplierInvoiceModel> box) {
    if (box.isEmpty) {
      return 0;
    } else {
      return box.values.first.productDetails?.length ?? 0;
    }
  }
}
