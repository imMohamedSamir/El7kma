import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImportPackageSec extends StatelessWidget {
  const ImportPackageSec({
    super.key,
    required this.isChecked,
    this.onChanged,
    required this.packageController,
  });
  final bool isChecked;
  final void Function(bool?)? onChanged;
  final TextEditingController packageController;
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
            onChanged: onChanged,
          )),
          Expanded(
              child: CustomTextField(
            controller: packageController,
            maxLines: 1,
            enabled: isChecked,
            keyboardType: TextInputType.number,
          )),
        ],
      ),
    );
  }
}
