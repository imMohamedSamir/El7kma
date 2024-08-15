import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InventoryHeaderSec extends StatelessWidget {
  const InventoryHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(250, context),
      child: Column(
        children: [
          const Gap(16),
          CustomTextField(
            label: S.of(context).Code,
          ),
          const Gap(16),
          CustomTextField(label: S.of(context).Product),
        ],
      ),
    );
  }
}
