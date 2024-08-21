import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:flutter/material.dart';

class ExportbillcardItem extends StatelessWidget {
  const ExportbillcardItem({super.key, required this.item});
  final ExprotItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.code,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.product,
          )),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            enabled: false,
            initialValue: item.price,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.qty,
          )),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            enabled: false,
            initialValue: item.totalprice,
          )),
        ],
      ),
    );
  }
}
