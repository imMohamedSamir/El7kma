import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportDateFilterSec.dart';
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
    final cubit = BlocProvider.of<ExportBillsCubit>(context);
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
                  UserNameDropDownMenu(
                    controller: cubit.userController,
                    onSelected: (value) {
                      BlocProvider.of<ExportBillsCubit>(context)
                          .get(userName: value.toString());
                    },
                  ),
                  const Gap(16),
                  CustomTextField(
                    controller: cubit.billNoController,
                    label: S.of(context).BillNo,
                    onChanged: (value) {
                      BlocProvider.of<ExportBillsCubit>(context).get();
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
                    controller: cubit.customerController,
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
            const ExportDateFilterSec()
          ],
        ),
      ),
    );
  }
}
