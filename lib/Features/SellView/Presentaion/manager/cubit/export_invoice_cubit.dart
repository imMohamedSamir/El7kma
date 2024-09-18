import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';
import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:el7kma/Features/SellView/data/repo/ExportRepo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'export_invoice_state.dart';

class ExportInvoiceCubit extends Cubit<ExportInvoiceState> {
  ExportInvoiceCubit(this._exportRepo) : super(ExportInvoiceInitial());
  final ExportRepo _exportRepo;
  final TextEditingController restController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController paidController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final box = Hive.box<ExportInvoiceModel>(kExportInvoices);

  ExportInvoiceModel invoice = ExportInvoiceModel();
  void initial() async {
    box.put("1", ExportInvoiceModel());
    _initialBillNo();
  }

  void addOrEditItem({required ExportItemModel product}) {
    final box = Hive.box<ExportInvoiceModel>(kExportInvoices);

    if (box.isEmpty) {
      initial(); // Initialize if the box is empty
    }

    // Retrieve the first invoice from the box
    ExportInvoiceModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the productDetails list if it's null
      invoice.items ??= [];

      // Find the index of the product with the same productCode (or use another identifier)
      int productIndex = invoice.items!.indexWhere(
          (existingProduct) => existingProduct.code == product.code);

      if (productIndex != -1) {
        // If the product exists, update it
        invoice.items![productIndex] = product;
        log("Product updated: ${product.code}");
      } else {
        // If the product doesn't exist, add it
        invoice.items!.add(product);
        log("New product added: ${product.code}");
      }

      // Save the updated invoice back to the Hive box
      box.putAt(0, invoice);

      // Log the updated length of the productDetails list
      log("Product count: ${invoice.items?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void addInvoice() {
    _getItems();
    invoice.date = DateTime.now();
    invoice.rest = double.tryParse(restController.text) ?? 0;
    invoice.totalPrice = double.tryParse(totalController.text) ?? 0;
    invoice.paid = double.tryParse(paidController.text) ?? 0;
    invoice.discount = double.tryParse(discountController.text) ?? 0;
  }

  void _getItems() {
    final box = Hive.box<ExportInvoiceModel>(kExportInvoices);
    if (box.isNotEmpty) {
      invoice.items = box.values.first.items;
    }
  }

  void clear() {
    final box = Hive.box<ExportInvoiceModel>(kExportInvoices);

    restController.clear();
    totalController.clear();
    paidController.clear();
    box.clear();
    initial();
    emit(ExportInvoiceCleared());
  }

  updateDiscountedTotal() {
    double total = _getTotalPrice();
    double discount = double.tryParse(discountController.text) ?? 0;
    if (discountController.text.trim().isEmpty || discount == 0) {
      totalController.text = _getTotalPrice().toString();
    } else {
      double discountedTotal = total - discount;
      totalController.text = discountedTotal.toStringAsFixed(2);
    }
  }

  void _generateBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int billNo = preferences.getInt(kExportBillNo) ?? 0;
    preferences.setInt(kExportBillNo, billNo++);
    billNoController.text = preferences.getInt(kExportBillNo).toString();
  }

  void _initialBillNo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    billNoController.text = preferences.getInt(kExportBillNo).toString();
  }

  double _getTotalPrice() {
    double total = 0;
    if (box.isNotEmpty && box.values.first.items != null) {
      for (var item in box.values.first.items!) {
        total += (item.totalPrice ?? 0);
      }
    }
    return total;
  }
}
