import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/OthersView/Presentaion/manager/cubit/expenses_cubit.dart';
import 'package:el7kma/Features/OthersView/Presentaion/views/AddExpensesBtn.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpensesHeaderSec extends StatelessWidget {
  const ExpensesHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ExpensesCubit>(context);
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
                  controller: cubit.billNoController,
                  label: S.of(context).BillNo,
                  enabled: false,
                ),
                const Gap(16),
                ValueListenableBuilder(
                  valueListenable: cubit.box.listenable(),
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    cubit.updateTotalAmount();
                    return CustomTextField(
                      controller: cubit.totalController,
                      label: S.of(context).Total,
                      enabled: false,
                      isEGP: true,
                    );
                  },
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: CustomTextField(
              controller: cubit.notesController,
              label: S.of(context).Notes,
              maxLines: 4,
            ),
          ),
          const Spacer(),
          AddExpensesBtn(cubit: cubit)
        ],
      ),
    );
  }
}
