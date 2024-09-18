import 'package:el7kma/Core/Utlis/FormatDate.dart';
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
                  label: S.of(context).BillNo,
                  enabled: false,
                  initialValue: bill.billNo,
                ),
                const Gap(16),
                CustomTextField(
                    label: S.of(context).UserName,
                    enabled: false,
                    initialValue: bill.userName),
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
                  initialValue: bill.totalAmount.toString(),
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
                  enabled: false,
                  initialValue: bill.paid?.toString() ?? "",
                  maxLines: 1,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Rest,
                  enabled: false,
                  initialValue: bill.rest?.toString() ?? "",
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
                  initialValue: fromatDate(value: bill.date ?? ""),
                  maxLines: 1,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Discount,
                  enabled: false,
                  initialValue: bill.discount?.toString() ?? "",
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
              initialValue: bill.notes,
            ),
          ),
        ],
      ),
    );
  }
}
