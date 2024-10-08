import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_item_model.dart';
import 'package:el7kma/Features/OthersView/data/repo/ExpensesRepo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit(this._expensesRepo) : super(ExpensesInitial());
  final ExpensesRepo _expensesRepo;
  final TextEditingController billNoController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final box = Hive.box<ExpensesInvoiceModel>(kExpensesInvoce);
  ExpensesInvoiceModel invoice = ExpensesInvoiceModel();

  void initial() async {
    box.put("1", ExpensesInvoiceModel());
    _initialBillNo();
  }

  void _generateBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int billNo = preferences.getInt(kExpensesBillNo) ?? 0;
    billNo++;
    preferences.setInt(kExpensesBillNo, billNo);
    billNoController.text = billNo.toString();
  }

  void _initialBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    billNoController.text =
        (preferences.getInt(kExpensesBillNo) ?? 0).toString();
  }

  void addOrEditItem({required ExpensesItemModel expense}) {
    if (box.isEmpty) {
      initial(); // Initialize if the box is empty
    }

    // Retrieve the first invoice from the box
    ExpensesInvoiceModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the productDetails list if it's null
      invoice.items ??= [];

      // Find the index of the product with the same productCode (or use another identifier)
      int productIndex = invoice.items!.indexWhere((existingProduct) =>
          existingProduct.expensesName == expense.expensesName);

      if (productIndex != -1) {
        // If the product exists, update it
        invoice.items![productIndex] = expense;
        log("Product updated: ${expense.expensesName}");
      } else {
        // If the product doesn't exist, add it
        invoice.items!.add(expense);
        log("New product added: ${expense.expensesName}");
      }

      // Save the updated invoice back to the Hive box
      box.putAt(0, invoice);

      // Log the updated length of the productDetails list
      log("Product count: ${invoice.items?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void deleteItem({required ExpensesItemModel product}) {
    if (box.isEmpty) {
      log("No invoice found to delete from!");
      return;
    }

    // Retrieve the first invoice from the box
    ExpensesInvoiceModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the items list if it's null
      invoice.items ??= [];

      // Find the index of the product with the same product code
      int productIndex = invoice.items!.indexWhere((existingProduct) =>
          existingProduct.expensesName == product.expensesName);

      if (productIndex != -1) {
        // If the product exists, delete it
        invoice.items!.removeAt(productIndex);
        log("Product deleted: ${product.expensesName}");

        // Save the updated invoice back to the Hive box
        box.putAt(0, invoice);
      } else {
        log("Product not found: ${product.expensesName}");
      }

      // Log the updated length of the items list
      log("Product count: ${invoice.items?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void addInvoice() async {
    emit(ExpensesLoading());
    _getItems();
    invoice.date = DateTime.now();
    invoice.totlPrice = double.tryParse(totalController.text) ?? 0;
    invoice.billNo = billNoController.text;
    invoice.notes = notesController.text;
    log(invoice.toJson().toString());
    final result = await _expensesRepo.add(invoice: invoice);
    result.fold((fail) {
      emit(ExpensesFailure());
    }, (response) {
      emit(ExpensesSuccess());
      _generateBillNo();
      clear();
    });
  }

  void _getItems() {
    if (box.isNotEmpty) {
      invoice.items = box.values.first.items;
    }
  }

  void clear() {
    notesController.clear();
    totalController.clear();
    box.clear();
    initial();
    emit(ExpensesCleared());
  }

  void updateTotalAmount() {
    double total = 0;
    if (box.isNotEmpty && box.values.first.items != null) {
      for (var item in box.values.first.items!) {
        total += (item.total ?? 0);
      }
    }
    totalController.text = total.toStringAsFixed(2);
  }
}
