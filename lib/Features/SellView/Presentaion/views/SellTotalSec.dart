import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SellTotalSec extends StatelessWidget {
  SellTotalSec({super.key});

  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);
  final TextEditingController restController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextField(
            label: S.of(context).Total,
            enabled: false,
            initialValue: "150",
            isEGP: true,
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).Paid,
            isEGP: true,
            onChanged: (p0) {
              double? paidAmount = double.tryParse(p0);
              if (paidAmount != null) {
                restNotifier.value = 150 - paidAmount;
                restController.text = restNotifier.value.abs().toString();
              }
              if (p0.trim().isEmpty || p0.isEmpty) {
                restNotifier.value = 150;
                restController.text = restNotifier.value.toString();
              }
            },
          ),
          const Gap(16),
          ValueListenableBuilder<double>(
            valueListenable: restNotifier,
            builder: (context, rest, child) {
              return CustomTextField(
                controller: restController,
                label: restLabel(rest, context),
                enabled: false,
                isEGP: true,
              );
            },
          ),
        ],
      ),
    );
  }

  String restLabel(double rest, BuildContext context) {
    if (rest >= 0) {
      return S.of(context).Rest;
    } else {
      return "ليه";
    }
  }
}
