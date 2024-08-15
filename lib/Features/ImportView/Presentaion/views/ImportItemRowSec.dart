import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemQty.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportPackageSec.dart';
import 'package:flutter/material.dart';

class ImportItemRowSec extends StatelessWidget {
  const ImportItemRowSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              onChanged: (p0) {},
            ),
          ),
          const Expanded(child: const CustomTextField()),
          const Expanded(
              child: CustomTextField(
            isEGP: true,
          )),
          const ImportItemQty(),
          const Expanded(
              child: CustomTextField(
            isEGP: true,
          )),
          const ImportPackageSec(),
        ],
      ),
    );
  }
}
