import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemQty.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportPackageSec.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:flutter/material.dart';

class ImportItemRowSec extends StatelessWidget {
  const ImportItemRowSec({super.key, required this.product});
  final ProductDetail product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
                initialValue: product.productCode, onChanged: (p0) {}),
          ),
          Expanded(
              child: CustomTextField(
            initialValue: product.productName,
          )),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            initialValue: product.unitPrice.toString(),
          )),
          // const ImportItemQty(controller: null,),
          Expanded(child: CustomTextField(isEGP: true, enabled: false)),
          // const ImportPackageSec(),
        ],
      ),
    );
  }
}
