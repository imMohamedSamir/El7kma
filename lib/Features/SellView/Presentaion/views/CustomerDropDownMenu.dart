import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerDropDownMenu extends StatelessWidget {
  const CustomerDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerSuccess) {
          BlocProvider.of<ExportInvoiceCubit>(context).invoice.customerId =
              state.id;
        }
      },
      child: Padding(
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
      ),
    );
  }

  Widget buildDropdownMenu(BuildContext context,
      {List<CustomerModel>? customers}) {
    return DropdownMenu(
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
      controller:
          BlocProvider.of<ExportInvoiceCubit>(context).customerController,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: AppStyles.styleSemiBold18(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      label: Text(S.of(context).CustomerName),
      onSelected: (value) {
        BlocProvider.of<ExportInvoiceCubit>(context).invoice.customerId =
            value.toString();
      },
      width: AppSizes.getWidth(310, context),
      dropdownMenuEntries: customers != null
          ? customers.map((customer) {
              return DropdownMenuEntry(
                label: customer.customerName ?? "",
                value: customer.id,
              );
            }).toList()
          : const [],
    );
  }
}
