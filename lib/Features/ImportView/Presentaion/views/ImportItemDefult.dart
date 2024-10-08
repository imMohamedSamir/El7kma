import 'dart:developer';

import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportItemQty.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportPackageSec.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportItemDefult extends StatefulWidget {
  const ImportItemDefult({super.key, this.product});
  final ProductDetail? product;

  @override
  _ImportItemDefultState createState() => _ImportItemDefultState();
}

class _ImportItemDefultState extends State<ImportItemDefult> {
  final TextEditingController codeController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController unitPriceController = TextEditingController();
  final TextEditingController packageController = TextEditingController();
  final ValueNotifier<double> totalNotifier = ValueNotifier<double>(0.0);

  bool isChecked = false;
  FocusNode codeFocuse = FocusNode();
  @override
  void initState() {
    super.initState();
    codeFocuse.requestFocus();
    // Add listeners to quantity and unit price fields to update the total
    qtyController.addListener(_updateTotalAmount);
    unitPriceController.addListener(_updateTotalAmount);
    packageController.addListener(() {
      widget.product?.packageQuantity =
          int.tryParse(packageController.text) ?? 0;
    });

    // If a product is passed, initialize the fields with its values
    _initializeFieldsWithProduct();
  }

  @override
  void dispose() {
    qtyController.dispose();
    totalController.dispose();
    unitPriceController.dispose();
    totalNotifier.dispose();
    super.dispose();
  }

  // Initialize the text fields with the product's data if it's provided
  void _initializeFieldsWithProduct() {
    if (widget.product != null) {
      final product = widget.product!;
      codeController.text = product.productCode ?? '';
      productController.text = product.productName ?? '';
      unitPriceController.text = product.unitPrice?.toString() ?? '';
      qtyController.text =
          product.quantity?.toString() ?? '1'; // Default to 1 if null
      totalController.text = product.totalPrice?.toStringAsFixed(2) ?? '';
      packageController.text = product.packageQuantity?.toString() ?? '0';
      isChecked =
          product.packageQuantity != null && product.packageQuantity! > 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImportItemCubit, ImportItemState>(
      listener: (context, state) {
        if (state is ImportItemClear) {
          clearData();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            final product = widget.product ?? ProductDetail();
            product.productCode = codeController.text.trim();
            product.productName = productController.text.trim();
            product.unitPrice =
                double.tryParse(unitPriceController.text.trim()) ?? 0.0;
            product.quantity = int.tryParse(qtyController.text.trim()) ?? 0;
            product.totalPrice = totalNotifier.value;
            product.packageQuantity =
                int.tryParse(packageController.text.trim()) ?? 0;
            product.isPackaged = isChecked;

            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              log(product.toJson().toString());
              BlocProvider.of<ImportItemCubit>(context)
                  .addOrEditItem(product: product);
            } else if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.delete) {
              BlocProvider.of<ImportItemCubit>(context)
                  .deleteItem(product: product);
              clearData();
            }
          },
          child: Row(
            children: [
              // Product Code Field
              Expanded(
                child: CustomTextField(
                  focusNode: codeFocuse,
                  controller: codeController,
                ),
              ),
              // Product Name Field
              Expanded(
                child: CustomTextField(
                  controller: productController,
                ),
              ),
              // Unit Price Field
              Expanded(
                child: CustomTextField(
                  controller: unitPriceController,
                  maxLines: 1,
                  isEGP: true,
                ),
              ),
              // Quantity Field
              ImportItemQty(controller: qtyController),
              // Total Price Field (Dynamic)
              ValueListenableBuilder<double>(
                valueListenable: totalNotifier,
                builder: (BuildContext context, double value, Widget? child) {
                  return Expanded(
                    child: CustomTextField(
                      controller: totalController,
                      isEGP: true,
                      enabled: false,
                    ),
                  );
                },
              ),
              // Package Section
              ImportPackageSec(
                isChecked: isChecked,
                packageController: packageController,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                  if (!isChecked) {
                    packageController.text = '0';
                  }
                  widget.product?.isPackaged = isChecked;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to update total amount dynamically based on qty and unit price
  void _updateTotalAmount() {
    double unitPrice = double.tryParse(unitPriceController.text) ?? 0.0;
    int quantity = int.tryParse(qtyController.text) ?? 0;
    double total = unitPrice * quantity;
    totalNotifier.value = total; // Update ValueNotifier

    totalController.text = total.toStringAsFixed(2); // Update total text field
  }

  void clearData() {
    // Temporarily remove listeners to avoid triggering them while clearing
    qtyController.removeListener(_updateTotalAmount);
    unitPriceController.removeListener(_updateTotalAmount);

    // Clear the text fields
    productController.clear();
    codeController.clear();
    qtyController.text = "1"; // Default value of 1 for quantity
    unitPriceController.clear();
    totalController.clear();
    packageController.clear();
    isChecked = false;

    // Reattach the listeners
    qtyController.addListener(_updateTotalAmount);
    unitPriceController.addListener(_updateTotalAmount);
  }
}
