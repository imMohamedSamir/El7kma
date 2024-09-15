import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/manager/import_bills_cubit/import_bills_cubit.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ImportTotalBuilder extends StatelessWidget {
  const ImportTotalBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController totalBills = TextEditingController();
    final TextEditingController totalBillsAmount = TextEditingController();
    return Expanded(
      child: BlocBuilder<ImportBillsCubit, ImportBillsState>(
        builder: (context, state) {
          if (state is ImportBillsSuccess) {
            totalBills.text = state.bills.length.toString();
            totalBillsAmount.text = getTotalAmount(state.bills).toString();
          } else {
            totalBillsAmount.text = "0.0";
            totalBills.text = "0";
          }
          return Column(
            children: [
              CustomTextField(
                controller: totalBillsAmount,
                label: S.of(context).totalAmount,
                enabled: false,
                isEGP: true,
              ),
              const Gap(16),
              CustomTextField(
                controller: totalBills,
                label: S.of(context).TotalBills,
                enabled: false,
              )
            ],
          );
        },
      ),
    );
  }

  double getTotalAmount(List<ImportBillsModel> bills) {
    double totalAmound = 0;
    if (bills.isNotEmpty) {
      for (var bill in bills) {
        double billPrice = bill.totalAmount!;
        totalAmound += billPrice;
      }
    }
    return totalAmound;
  }
}
