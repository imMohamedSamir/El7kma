import 'dart:developer';

import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/manager/cubit/expenses_cubit.dart';
import 'package:el7kma/Features/ExpansesView/data/models/expenses_item_model.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpansesItemRowSec extends StatefulWidget {
  const ExpansesItemRowSec({super.key, this.expenses});
  final ExpensesItemModel? expenses;
  @override
  State<ExpansesItemRowSec> createState() => _ExpansesItemRowSecState();
}

class _ExpansesItemRowSecState extends State<ExpansesItemRowSec> {
  ExpensesItemModel expenses = ExpensesItemModel();
  TextEditingController qtyController = TextEditingController();
  TextEditingController expensesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  late ExpensesCubit cubit;
  FocusNode focusNode = FocusNode();
  void _updateTotalAmount() {
    double unitPrice = double.tryParse(priceController.text) ?? 0.0;
    int quantity = int.tryParse(qtyController.text) ?? 0;
    double total = unitPrice * quantity;
    totalController.text = total.toStringAsFixed(2); // Update total text field
  }

  ExpensesItemModel saveData() {
    final expenses = widget.expenses ?? ExpensesItemModel();
    expenses.expensesName = expensesController.text.trim();
    expenses.price = double.tryParse(priceController.text.trim()) ?? 0.0;
    expenses.qty = int.tryParse(qtyController.text.trim()) ?? 0;
    expenses.total = double.tryParse(totalController.text) ?? 0;
    return expenses;
  }

  @override
  void initState() {
    cubit = BlocProvider.of<ExpensesCubit>(context);
    focusNode.requestFocus();
    qtyController.addListener(_updateTotalAmount);
    priceController.addListener(_updateTotalAmount);
    super.initState();
  }

  @override
  void dispose() {
    qtyController.dispose();
    totalController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpensesCubit, ExpensesState>(
      listener: (context, state) {
        if (state is ExpensesCleared) {
          clearData();
        }
      },
      child: KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: (event) {
          expenses = saveData();
          if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.enter) {
            log(expenses.toJson().toString());
            cubit.addOrEditItem(expense: expenses);
          } else if (event is KeyDownEvent &&
              event.logicalKey == LogicalKeyboardKey.delete) {
            cubit.deleteItem(product: expenses);

            clearData();
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: CustomTextField(
                      focusNode: focusNode, controller: expensesController)),
              Expanded(
                  child: CustomTextField(
                      controller: priceController, isEGP: true, maxLines: 1)),
              SellItemsQty(controller: qtyController),
              Expanded(
                  child: CustomTextField(
                      controller: totalController,
                      isEGP: true,
                      enabled: false)),
            ],
          ),
        ),
      ),
    );
  }

  void clearData() {
    // Temporarily remove listeners to avoid triggering them while clearing
    qtyController.removeListener(_updateTotalAmount);
    priceController.removeListener(_updateTotalAmount);
    qtyController.text = "1"; // Default value of 1 for quantity
    expensesController.clear();

    priceController.clear();
    totalController.clear();

    // Reattach the listeners
    qtyController.addListener(_updateTotalAmount);
    priceController.addListener(_updateTotalAmount);
  }
}
