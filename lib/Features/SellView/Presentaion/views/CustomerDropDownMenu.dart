import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDropDownMenu extends StatelessWidget {
  const CustomerDropDownMenu(
      {super.key, this.onSelected, this.controller, this.isBill = false});
  final void Function(Object?)? onSelected;
  final TextEditingController? controller;
  final bool isBill;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: BlocBuilder<CustomerCubit, CustomerState>(
        builder: (context, state) {
          if (state is CustomerSuccess) {
            final customers = state.customers;
            return buildDropdownMenu(context, customers: customers);
          } else {
            return buildDropdownMenu(context);
          }
        },
      ),
    );
  }

  Widget buildDropdownMenu(BuildContext context,
      {List<CustomerModel>? customers}) {
    return DropdownMenu<dynamic>(
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
      label: Text(S.of(context).CustomerName),
      onSelected: onSelected,
      width: AppSizes.getWidth(310, context),
      dropdownMenuEntries: customers != null
          ? customers.map((customer) {
              return DropdownMenuEntry(
                label: customer.customerName ?? "",
                value: isBill ? customer.customerName : customer.id,
              );
            }).toList()
          : const [],
    );
  }
}
