import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImportPackageSec extends StatefulWidget {
  const ImportPackageSec({
    super.key,
  });

  @override
  State<ImportPackageSec> createState() => _ImportPackageSecState();
}

class _ImportPackageSecState extends State<ImportPackageSec> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Checkbox(
            activeColor: pKcolor,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: isChecked,
            keyboardType: TextInputType.number,
          )),
        ],
      ),
    );
  }
}
