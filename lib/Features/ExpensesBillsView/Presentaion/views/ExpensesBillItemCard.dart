import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/ExpensesItem.dart';
import 'package:flutter/material.dart';

class ExpensesBillItemCard extends StatelessWidget {
  const ExpensesBillItemCard({super.key, required this.item});
  final ExpensesItem item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              enabled: false,
              initialValue: item.expenseName,
            ),
          ),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
            initialValue: item.unitPrice.toString(),
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            initialValue: item.quantity.toString(),
          )),
          Expanded(
              child: CustomTextField(
            enabled: false,
            isEGP: true,
            initialValue: item.total.toString(),
          )),
        ],
      ),
    );
  }
}
