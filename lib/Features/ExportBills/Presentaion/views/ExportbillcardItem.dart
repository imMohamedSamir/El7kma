import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class ExportbillcardItem extends StatelessWidget {
  const ExportbillcardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: CustomTextField(
          enabled: false,
        )),
        Expanded(
            child: CustomTextField(
          enabled: false,
        )),
        Expanded(
            child: CustomTextField(
          isEGP: true,
          enabled: false,
        )),
        Expanded(
            child: CustomTextField(
          enabled: false,
        )),
        Expanded(child: const CustomTextField(isEGP: true, enabled: false)),
      ],
    );
  }
}
