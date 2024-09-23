import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_item_model.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_model.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/repo/DamagedAndReturnRepo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'damaged_retrun_state.dart';

class DamagedRetrunCubit extends Cubit<DamagedRetrunState> {
  DamagedRetrunCubit(this._repo) : super(DamagedRetrunInitial());
  final DamagedAndReturnRepo _repo;
  final TextEditingController billNoController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final box = Hive.box<DamagedRetrunModel>(kdamagedRetrunInvoice);
  DamagedRetrunModel invoice = DamagedRetrunModel();
  void initial() async {
    box.put("1", DamagedRetrunModel());
    _initialBillNo();
  }

  void _generateBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int billNo = preferences.getInt(kdamagedRetrunBillNo) ?? 0;
    billNo++;
    preferences.setInt(kdamagedRetrunBillNo, billNo);
    billNoController.text = billNo.toString();
  }

  void _initialBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    billNoController.text =
        (preferences.getInt(kdamagedRetrunBillNo) ?? 0).toString();
  }

  void addOrEditItem({required DamagedReturnItemModel product}) {
    if (box.isEmpty) {
      initial(); // Initialize if the box is empty
    }

    // Retrieve the first invoice from the box
    DamagedRetrunModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the productDetails list if it's null
      invoice.items ??= [];

      // Find the index of the product with the same productCode (or use another identifier)
      int productIndex = invoice.items!.indexWhere((existingProduct) =>
          existingProduct.productCode == product.productCode);

      if (productIndex != -1) {
        // If the product exists, update it
        invoice.items![productIndex] = product;
        log("Product updated: ${product.productCode}");
      } else {
        // If the product doesn't exist, add it
        invoice.items!.add(product);
        log("New product added: ${product.productCode}");
      }

      // Save the updated invoice back to the Hive box
      box.putAt(0, invoice);

      // Log the updated length of the productDetails list
      log("Product count: ${invoice.items?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void deleteItem({required DamagedReturnItemModel product}) {
    if (box.isEmpty) {
      log("No invoice found to delete from!");
      return;
    }

    // Retrieve the first invoice from the box
    DamagedRetrunModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the items list if it's null
      invoice.items ??= [];

      // Find the index of the product with the same product code
      int productIndex = invoice.items!.indexWhere((existingProduct) =>
          existingProduct.productCode == product.productCode);

      if (productIndex != -1) {
        // If the product exists, delete it
        invoice.items!.removeAt(productIndex);
        log("Product deleted: ${product.productCode}");

        // Save the updated invoice back to the Hive box
        box.putAt(0, invoice);
      } else {
        log("Product not found: ${product.productCode}");
      }

      // Log the updated length of the items list
      log("Product count: ${invoice.items?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void addInvoice() async {
    emit(DamagedRetrunLoading());
    _getItems();
    _checkType();

    invoice.date = DateTime.now();
    invoice.totalAmount = double.tryParse(totalController.text) ?? 0;
    invoice.invoiceNumber = int.parse(billNoController.text);
    invoice.notes = notesController.text;
    log(invoice.toJson().toString());
    final result = await _repo.add(invoice: invoice);
    result.fold((fail) {
      emit(DamagedRetrunFailure());
    }, (response) {
      emit(DamagedRetrunSuccess());
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
    emit(DamagedRetrunCleared());
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

  void _checkType() {
    if (typeController.text == "مرتجع") {
      invoice.type = "Refund";
    } else if (totalController.text == "تالف") {
      invoice.type = "Damaged";
    }
  }
}
