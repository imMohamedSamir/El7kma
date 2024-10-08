import 'package:el7kma/Features/DashboardView/Presentaion/manager/expenses_get_cubit/expenses_get_cubit.dart';
import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpensesBillsCard.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillsLaoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpensesTable extends StatelessWidget {
  const ExpensesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesGetCubit, ExpensesGetState>(
      builder: (context, state) {
        if (state is ExpensesGetSuccess) {
          final expenses = state.expneses;
          return Column(
            children: List.generate(expenses.length,
                (index) => ExpensesBillsCard(expensesModel: expenses[index])),
          );
        } else if (state is ExpensesGetLoading) {
          return const ExportLaoding();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
