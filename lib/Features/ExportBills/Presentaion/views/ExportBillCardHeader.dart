import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExportBillCardHeader extends StatelessWidget {
  const ExportBillCardHeader({super.key, required this.bill});
  final ExportBillModel bill;
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
                    initialValue: bill.userName),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).BillNo,
                  enabled: false,
                  initialValue: bill.billNo,
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).CustomerName,
                  enabled: false,
                  initialValue: bill.customerName,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Total,
                  enabled: false,
                  initialValue: bill.totalAmount,
                  isEGP: true,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).Date,
                  enabled: false,
                  initialValue: bill.date,
                ),
                Gap(16),
                CustomTextField(
                  label: S.of(context).Sale,
                  enabled: false,
                  initialValue: "",
                ),
              ],
            ),
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
