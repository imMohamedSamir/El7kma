import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class InventoryPackageSec extends StatefulWidget {
  const InventoryPackageSec({super.key, this.isChecked = false});
  final bool isChecked;

  @override
  State<InventoryPackageSec> createState() => _InventoryPackageSecState();
}

class _InventoryPackageSecState extends State<InventoryPackageSec> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Checkbox(
            isError: true,
            activeColor: pKcolor,
            value: widget.isChecked || checked,
            onChanged: (value) {
              setState(() {
                checked = !checked;
              });
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: widget.isChecked || checked,
            keyboardType: TextInputType.number,
          )),
        ],
      ),
    );
  }
}
