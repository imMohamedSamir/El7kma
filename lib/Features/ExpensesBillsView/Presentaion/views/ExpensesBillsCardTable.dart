import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpensesBillItemCard.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/ExpensesItem.dart';
import 'package:flutter/material.dart';

class ExpensesBillsCardTable extends StatelessWidget {
  const ExpensesBillsCardTable({super.key, required this.items});
  final List<ExpensesItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          items.length,
          (index) => ExpensesBillItemCard(
                item: items[index],
              )),
    );
  }
}
