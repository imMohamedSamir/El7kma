import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierDropDownMenu extends StatelessWidget {
  const SupplierDropDownMenu(
      {super.key, this.isBill = false, this.onSelected, this.controller});
  final bool isBill;
  final void Function(Object?)? onSelected;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: BlocBuilder<SuppliersCubit, SuppliersState>(
        builder: (context, state) {
          if (state is SuppliersSuccess) {
            final suppliers = state.suppliers;
            return buildDropdownMenu(context, suppliers: suppliers);
          } else {
            return buildDropdownMenu(context);
          }
        },
      ),
    );
  }

  Widget buildDropdownMenu(BuildContext context,
      {List<SuppliersModel>? suppliers}) {
    return DropdownMenu<String?>(
      enableFilter: true,
      menuStyle: MenuStyle(
        shape: WidgetStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
        ),
      ),
      controller: controller,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppStyles.styleSemiBold18(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      label: Text(S.of(context).SupplierName),
      onSelected: onSelected,
      width: AppSizes.getWidth(310, context),
      dropdownMenuEntries: suppliers != null
          ? suppliers.map((supplier) {
              return DropdownMenuEntry(
                label: supplier.supplierName ?? "",
                value: isBill ? supplier.supplierName : supplier.supplierId,
              );
            }).toList()
          : const [],
    );
  }
}
