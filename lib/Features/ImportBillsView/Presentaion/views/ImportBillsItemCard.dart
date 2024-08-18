import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsPackageSec.dart';
import 'package:flutter/material.dart';

class ImportBillsItemCard extends StatelessWidget {
  const ImportBillsItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              enabled: false,
            ),
          ),
          Expanded(
              child: CustomTextField(
            enabled: false,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
          )),
          ImportBillsPackageSec(
            isChecked: true,
          ),
        ],
      ),
    );
  }
}
