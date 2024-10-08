import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpensesBillsCardBody.dart';
import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpnesesBillsCardHeader.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';
import 'package:flutter/material.dart';

class ExpensesBillsCard extends StatelessWidget {
  const ExpensesBillsCard({super.key, required this.expensesModel});
  final ExpensesModel expensesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 8,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: const Color(0xffEFF1F2),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              ExpnesesBillsCardHeader(bill: expensesModel),
              ExpensesBillsCardBody(items: expensesModel.items ?? [])
            ],
          ),
        ),
      ),
    );
  }
}
