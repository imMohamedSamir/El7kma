import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportTotalSec.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/SupplierDropDownMenu.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportHeaderSec extends StatelessWidget {
  const ImportHeaderSec({super.key});

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
                  enabled: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      BlocProvider.of<ImportItemCubit>(context)
                          .invoice
                          .invoiceNumber = value.trim();
                    }
                  },
                ),
                const Gap(16),
                const SupplierDropDownMenu(),
              ],
            ),
          ),
          const Gap(16),
          ImportTotalSec(),
          const Gap(16),
          Expanded(
            child: CustomTextField(
                hintText: S.of(context).Notes,
                maxLines: 7,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    BlocProvider.of<ImportItemCubit>(context).invoice.notes =
                        value.trim();
                  }
                }),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                CustomButton(
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  text: S.of(context).add,
                  onPressed: () {
                    BlocProvider.of<ImportItemCubit>(context).addInvoice();
                  },
                ),
                const Gap(16),
                CustomButton(
                  txtcolor: Colors.white,
                  btncolor: pKcolor,
                  text: S.of(context).Reset,
                  onPressed: () {
                    BlocProvider.of<ImportItemCubit>(context).clear();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
