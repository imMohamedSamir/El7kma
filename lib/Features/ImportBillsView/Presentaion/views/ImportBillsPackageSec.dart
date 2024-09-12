import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class ImportBillsPackageSec extends StatelessWidget {
  const ImportBillsPackageSec(
      {super.key, this.isChecked = false, required this.packageQty});
  final bool isChecked;
  final String packageQty;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Checkbox(
            activeColor: pKcolor,
            fillColor:
                isChecked ? WidgetStateProperty.all<Color>(pKcolor) : null,
            value: isChecked,
            onChanged: null,
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: packageQty,
          )),
        ],
      ),
    );
  }
}
