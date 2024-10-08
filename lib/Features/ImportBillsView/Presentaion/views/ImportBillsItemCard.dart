import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsPackageSec.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportItemModel.dart';
import 'package:flutter/material.dart';

class ImportBillsItemCard extends StatelessWidget {
  const ImportBillsItemCard({super.key, required this.item});
  final ImportItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              enabled: false,
              initialValue: item.code,
            ),
          ),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.product,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
            initialValue: item.price.toString(),
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.qty.toString(),
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
            initialValue: item.totalprice.toString(),
          )),
          ImportBillsPackageSec(
              isChecked: item.package ?? false,
              packageQty: item.packageQty.toString()),
        ],
      ),
    );
  }
}
