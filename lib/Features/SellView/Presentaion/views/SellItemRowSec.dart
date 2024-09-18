import 'dart:developer';

import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:el7kma/Features/SellView/data/models/export_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class SellItemRowSec extends StatefulWidget {
  const SellItemRowSec({
    super.key,
    this.itemModel,
  });
  final ExportItemModel? itemModel;
  @override
  State<SellItemRowSec> createState() => _SellItemRowSecState();
}

class _SellItemRowSecState extends State<SellItemRowSec> {
  Inventoryitemsmodel item = Inventoryitemsmodel();
  TextEditingController codeController = TextEditingController();
  TextEditingController productController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);
  FocusNode codeFocusNode = FocusNode();
  FocusNode qtyFocusNode = FocusNode();
  @override
  void initState() {
    qtyController.addListener(_updateTotalAmount);
    priceController.addListener(_updateTotalAmount);
    codeFocusNode.requestFocus();
    super.initState();
  }

  void getData({bool isCode = true, String? code, String? name}) {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);

    setState(() {
      if (isCode) {
        item = box.values.firstWhere((element) => element.code == code);
      } else {
        item = box.values.firstWhere((element) => element.product == name);
      }
      if (item.isPackage ?? false) {
        priceController.text = item.unitPrice.toString();
      } else {
        priceController.text = item.price.toString();
      }
      productController.text = item.product ?? "";
      codeController.text = item.code ?? "";
    });
  }

  void _updateTotalAmount() {
    double unitPrice = double.tryParse(priceController.text) ?? 0.0;
    int quantity = int.tryParse(qtyController.text) ?? 0;
    double total = unitPrice * quantity;

    totalController.text = total.toStringAsFixed(2); // Update total text field
  }

  void _initializeFieldsWithProduct() {
    if (widget.itemModel != null) {
      final product = widget.itemModel!;
      codeController.text = product.code ?? '';
      productController.text = product.product ?? '';
      priceController.text = product.unitPrice?.toString() ?? '';
      qtyController.text =
          product.quantity?.toString() ?? '1'; // Default to 1 if null
      totalController.text = product.totalPrice?.toStringAsFixed(2) ?? '';
    }
  }

  @override
  void dispose() {
    productController.dispose();
    codeController.dispose();
    qtyController.dispose();
    totalController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExportInvoiceCubit, ExportInvoiceState>(
      listener: (context, state) {
        if (state is ExportInvoiceCleared) {
          clearData();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              final product = widget.itemModel ?? ExportItemModel();
              product.code = codeController.text.trim();
              product.product = productController.text.trim();
              product.unitPrice =
                  double.tryParse(priceController.text.trim()) ?? 0.0;
              product.quantity = int.tryParse(qtyController.text.trim()) ?? 0;
              product.totalPrice = double.tryParse(totalController.text) ?? 0;

              log(product.toJson().toString());
              BlocProvider.of<ExportInvoiceCubit>(context)
                  .addOrEditItem(product: product);
            }
          },
          child: Row(
            children: [
              SellDropDownMenu(
                focusNode: codeFocusNode,
                controller: codeController,
                isCode: true,
                onSelected: (p0) {
                  getData(code: p0.toString());
                  qtyFocusNode.requestFocus();
                },
              ),
              SellDropDownMenu(
                controller: productController,
                onSelected: (p0) {
                  getData(isCode: false, name: p0.toString());
                },
              ),
              Expanded(
                  child: CustomTextField(
                      controller: priceController, isEGP: true)),
              SellItemsQty(focusNode: qtyFocusNode, controller: qtyController),
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

    // Clear the text fields
    productController.clear();
    codeController.clear();
    qtyController.text = "1"; // Default value of 1 for quantity
    priceController.clear();
    totalController.clear();

    // Reattach the listeners
    qtyController.addListener(_updateTotalAmount);
    priceController.addListener(_updateTotalAmount);
  }
}
