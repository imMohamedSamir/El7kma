import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:el7kma/Features/ImportView/data/repo/ImportRepo.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'import_item_state.dart';

class ImportItemCubit extends Cubit<ImportItemState> {
  ImportItemCubit(this._importRepo) : super(ImportItemInitial());
  final ImportRepo _importRepo;
  final TextEditingController restController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController paidController = TextEditingController();
  AddSupplierInvoiceModel invoice = AddSupplierInvoiceModel();
  void initial() async {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);
    box.put("1", AddSupplierInvoiceModel());
  }

  void addOrEditItem({required ProductDetail product}) {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);

    if (box.isEmpty) {
      initial(); // Initialize if the box is empty
    }

    // Retrieve the first invoice from the box
    AddSupplierInvoiceModel? invoice = box.getAt(0);

    if (invoice != null) {
      // Initialize the productDetails list if it's null
      invoice.productDetails ??= [];

      // Find the index of the product with the same productCode (or use another identifier)
      int productIndex = invoice.productDetails!.indexWhere((existingProduct) =>
          existingProduct.productCode == product.productCode);

      if (productIndex != -1) {
        // If the product exists, update it
        invoice.productDetails![productIndex] = product;
        log("Product updated: ${product.productCode}");
      } else {
        // If the product doesn't exist, add it
        invoice.productDetails!.add(product);
        log("New product added: ${product.productCode}");
      }

      // Save the updated invoice back to the Hive box
      box.putAt(0, invoice);

      // Log the updated length of the productDetails list
      log("Product count: ${invoice.productDetails?.length.toString() ?? "empty"}");
    } else {
      log("Invoice not found!");
    }
  }

  void addInvoice() async {
    _getItems();
    invoice.totalAmount = double.tryParse(totalController.text) ?? 0;
    invoice.paidAmount = double.tryParse(paidController.text) ?? 0;
    invoice.remainingAmount = double.tryParse(restController.text) ?? 0;
    invoice.date = DateTime.now();
    log(invoice.toJson().toString());
    emit(ImportItemLoadign());
    final result = await _importRepo.add(invoice: invoice);
    result.fold((fail) => emit(ImportItemFailure()), (response) {
      emit(ImportItemSuccess());
      clear();
    });
  }

  void _getItems() {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);
    if (box.isNotEmpty) {
      invoice.productDetails = box.values.first.productDetails;
    }
  }

  void clear() {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);

    restController.clear();
    totalController.clear();
    paidController.clear();
    box.clear();
    emit(ImportItemClear());
  }
}
