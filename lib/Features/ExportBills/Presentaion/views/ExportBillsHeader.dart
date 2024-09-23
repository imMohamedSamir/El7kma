import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportTotalBillsBuilder.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/UserNameDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/CustomerDropDownMenu.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ExportBillsHeader extends StatelessWidget {
  const ExportBillsHeader({super.key});

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
                  const UserNameDropDownMenu(),
                  const Gap(16),
                  CustomTextField(
                    label: S.of(context).BillNo,
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        BlocProvider.of<ExportBillsCubit>(context)
                            .get(billNo: value.trim());
                      } else {
                        BlocProvider.of<ExportBillsCubit>(context).get();
                      }
                    },
                  ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                children: [
                  CustomerDropDownMenu(
                    isBill: true,
                    onSelected: (value) {
                      BlocProvider.of<ExportBillsCubit>(context)
                          .get(customerName: value.toString());
                    },
                  ),
                ],
              ),
            ),
            const Gap(16),
            const ExportTotalBillsBuilder(),
            const Spacer(),
            Expanded(
              child: CustomDateTextField(
                controller: controller,
                hint: S.of(context).Date,
                maxline: 2,
                onTap: () {
                  Dialogmethods.dateTimeDialog(
                    context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
