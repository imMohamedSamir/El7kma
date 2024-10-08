import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/manager/import_bills_cubit/import_bills_cubit.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportDateFilterSec.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportTotalBuilder.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/SupplierDropDownMenu.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportBillsHeader extends StatelessWidget {
  const ImportBillsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ImportBillsCubit>(context);
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
                  SupplierDropDownMenu(
                    controller: cubit.supplierController,
                    onSelected: (p0) {
                      cubit.get();
                    },
                  ),
                  // CustomTextField(
                  //   label: S.of(context).SupplierName,
                  //   onChanged: (value) {
                  //     if (value.trim().isNotEmpty) {
                  //       BlocProvider.of<ImportBillsCubit>(context)
                  //           .get(supplierName: value.trim());
                  //     } else {
                  //       BlocProvider.of<ImportBillsCubit>(context).get();
                  //     }
                  //   },
                  // ),
                  const Gap(16),
                  CustomTextField(
                      controller: cubit.billNoController,
                      label: S.of(context).BillNo,
                      onChanged: (value) {
                        BlocProvider.of<ImportBillsCubit>(context).get();
                      }),
                ],
              ),
            ),
            const Gap(16),
            const ImportTotalBuilder(),
            const Spacer(),
            const ImportDateFilterSec(),
          ],
        ),
      ),
    );
  }
}
