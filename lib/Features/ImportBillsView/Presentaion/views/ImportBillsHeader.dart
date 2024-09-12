import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportTotalBuilder.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/SupplierDropDownMenu.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ImportBillsHeader extends StatelessWidget {
  const ImportBillsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return SizedBox(
      // width: AppSizes.getWidth(500, context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SupplierDropDownMenu(isBill: true),
                  const Gap(16),
                  CustomTextField(label: S.of(context).BillNo),
                ],
              ),
            ),
            const Gap(16),
            const ImportTotalBuilder(),
            const Spacer(),
            Expanded(
              child: CustomDateTextField(
                controller: controller,
                hint: S.of(context).Date,
                maxline: 2,
                onTap: () {
                  Dialogmethods.dateTimeDialog(context, controller: controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
