import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsCardHeader extends StatelessWidget {
  const ImportBillsCardHeader({super.key, required this.bill});
  final ImportBillsModel bill;

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
                  label: S.of(context).SupplierName,
                  enabled: false,
                  initialValue: bill.supplierName,
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).Total,
                  enabled: false,
                  initialValue: bill.totalAmount.toString(),
                  isEGP: true,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Paid,
                  isEGP: true,
                  enabled: false,
                  initialValue: bill.paid.toString(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  label: S.of(context).Rest,
                  enabled: false,
                  initialValue: bill.rest.toString(),
                  isEGP: true,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).Date,
                  enabled: false,
                  initialValue: bill.date.toString(),
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
