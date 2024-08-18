import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsCardHeader extends StatelessWidget {
  const ImportBillsCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                    label: S.of(context).UserName,
                    enabled: false,
                    initialValue: "ahmed"),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).BillNo,
                  enabled: false,
                  initialValue: "150",
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).SupplierName,
                  enabled: false,
                  initialValue: "ali",
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Total,
                  enabled: false,
                  initialValue: "150 ",
                  isEGP: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).Paid,
                  isEGP: true,
                  enabled: false,
                  initialValue: "150 ",
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Rest,
                  enabled: false,
                  initialValue: "150 ",
                  isEGP: true,
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomTextField(
              hintText: S.of(context).Notes,
              enabled: false,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
