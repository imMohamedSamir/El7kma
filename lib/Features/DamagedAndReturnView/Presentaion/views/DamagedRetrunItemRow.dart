import 'dart:developer';

import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/manager/cubit/damaged_retrun_cubit.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_item_model.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class DamagedRetrunItemRow extends StatefulWidget {
  const DamagedRetrunItemRow({super.key, this.itemModel});
  final DamagedReturnItemModel? itemModel;
  @override
  State<DamagedRetrunItemRow> createState() => _DamagedRetrunItemRowState();
}

class _DamagedRetrunItemRowState extends State<DamagedRetrunItemRow> {
  Inventoryitemsmodel item = Inventoryitemsmodel();
  TextEditingController codeController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);
  FocusNode codeFocusNode = FocusNode();
  FocusNode qtyFocusNode = FocusNode();
  int? maxQty;
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

  DamagedReturnItemModel _saveData() {
    final product = widget.itemModel ?? DamagedReturnItemModel();
    product.productCode = codeController.text.trim();
    product.productName = productController.text.trim();
    product.unitPrice = double.tryParse(priceController.text.trim()) ?? 0.0;
    product.quantity = int.tryParse(qtyController.text.trim()) ?? 0;
    product.total = double.tryParse(totalController.text) ?? 0;
    return product;
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
    return BlocListener<DamagedRetrunCubit, DamagedRetrunState>(
      listener: (context, state) {
        if (state is DamagedRetrunCleared) {
          clearData();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: KeyboardListener(
          focusNode: FocusNode(),
          autofocus: true,
          onKeyEvent: (event) {
            final product = _saveData();
            if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              log(product.toJson().toString());
              BlocProvider.of<DamagedRetrunCubit>(context)
                  .addOrEditItem(product: product);
            } else if (event is KeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.delete) {
              BlocProvider.of<DamagedRetrunCubit>(context)
                  .deleteItem(product: product);
              clearData();
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
                  qtyFocusNode.requestFocus();
                },
              ),
              Expanded(
                  child: CustomTextField(
                      controller: priceController, isEGP: true)),
              SellItemsQty(
                focusNode: qtyFocusNode,
                controller: qtyController,
              ),
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
