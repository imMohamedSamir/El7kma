import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ImportTotalSec extends StatelessWidget {
  ImportTotalSec({super.key});

  final ValueNotifier<double> restNotifier = ValueNotifier<double>(0.0);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<AddSupplierInvoiceModel>(supplierInvoices);
    final cubit = BlocProvider.of<ImportItemCubit>(context);

    return Expanded(
      child: Column(
        children: [
          _buildTotalField(box, cubit, context),
          const Gap(16),
          _buildPaidField(context, box, cubit),
          const Gap(16),
          _buildRestField(cubit, context),
        ],
      ),
    );
  }

  /// Build the total field
  Widget _buildTotalField(Box<AddSupplierInvoiceModel> box,
      ImportItemCubit cubit, BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, dynamic value, Widget? child) {
        _updateTotalAmount(box, cubit.totalController);
        return CustomTextField(
          controller: cubit.totalController,
          label: S.of(context).Total,
          enabled: false,
          isEGP: true,
        );
      },
    );
  }

  /// Build the paid field with change listener
  Widget _buildPaidField(BuildContext context, Box<AddSupplierInvoiceModel> box,
      ImportItemCubit cubit) {
    _handlePaidAmountChanged("0", box, cubit);
    return CustomTextField(
      controller: cubit.paidController,
      label: S.of(context).Paid,
      isEGP: true,
      onChanged: (value) => _handlePaidAmountChanged(value, box, cubit),
    );
  }

  /// Build the rest field
  Widget _buildRestField(ImportItemCubit cubit, BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: restNotifier,
      builder: (context, rest, child) {
        return CustomTextField(
          controller: cubit.restController,
          label: _getRestLabel(rest, context),
          enabled: false,
          isEGP: true,
        );
      },
    );
  }

  /// Handle changes in the paid amount
  void _handlePaidAmountChanged(
      String value, Box<AddSupplierInvoiceModel> box, ImportItemCubit cubit) {
    double? paidAmount = double.tryParse(value);
    double totalAmount = _updateTotalAmount(box, cubit.totalController);

    if (paidAmount != null) {
      restNotifier.value = totalAmount - paidAmount;
    } else {
      restNotifier.value = totalAmount;
    }

    cubit.restController.text = restNotifier.value.abs().toString();
  }

  /// Update the total amount based on the box values
  double _updateTotalAmount(
      Box<AddSupplierInvoiceModel> box, TextEditingController totalController) {
    double total = 0;
    if (box.isNotEmpty && box.values.first.productDetails != null) {
      for (var item in box.values.first.productDetails!) {
        total += (item.totalPrice ?? 0);
      }
    }
    totalController.text = total.toStringAsFixed(2);
    return total;
  }

  /// Get the label for the rest field based on the remaining amount
  String _getRestLabel(double rest, BuildContext context) {
    return rest >= 0 ? S.of(context).Rest : "ليك";
  }
}
