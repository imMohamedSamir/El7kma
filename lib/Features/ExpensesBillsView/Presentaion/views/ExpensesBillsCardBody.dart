import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpensesBillsCardTable.dart';
import 'package:el7kma/Features/OthersView/Presentaion/views/ExpensesItemHeader.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/ExpensesItem.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ExpensesBillsCardBody extends StatelessWidget {
  const ExpensesBillsCardBody({super.key, required this.items});
  final List<ExpensesItem> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExpensesItemHeader(),
        const Gap(16),
        ExpensesBillsCardTable(items: items),
        const Gap(16)
      ],
    );
  }
}
