import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/manager/expenses_get_cubit/expenses_get_cubit.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardHeaderCard.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardLoading.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardHeaderSec extends StatelessWidget {
  const DashboardHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          BlocBuilder<ExpensesGetCubit, ExpensesGetState>(
            builder: (context, state) {
              if (state is ExpensesGetSuccess) {
                return DashboardHeaderCard(
                  title: S.of(context).ExpensesBills,
                  body: _totalExpenses(expenses: state.expneses).toString(),
                  onTap: () {
                    Dialogmethods.showExpensesBills(context);
                  },
                );
              } else {
                return const DashboardLoading();
              }
            },
          ),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  double _totalExpenses({required List<ExpensesModel> expenses}) {
    double total = 0;
    for (var element in expenses) {
      total += element.totalAmount ?? 0;
    }
    return total;
  }
}
