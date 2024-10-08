import 'package:el7kma/Core/Utlis/FormatDate.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpnesesBillsCardHeader extends StatelessWidget {
  const ExpnesesBillsCardHeader({super.key, required this.bill});
  final ExpensesModel bill;

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
                  initialValue: bill.invoiceNumber,
                ),
                const Gap(16),
                CustomTextField(
                  label: S.of(context).UserName,
                  enabled: false,
                  initialValue: bill.employee,
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
                  label: S.of(context).Date,
                  enabled: false,
                  initialValue: fromatDate(value: bill.date ?? ""),
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
