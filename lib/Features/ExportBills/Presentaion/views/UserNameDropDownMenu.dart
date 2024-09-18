import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameDropDownMenu extends StatelessWidget {
  const UserNameDropDownMenu({super.key});
  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: BlocBuilder<EmployeeCubit, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeSuccess) {
            final suppliers = state.employees;
            return buildDropdownMenu(context, suppliers: suppliers);
          } else {
            return buildDropdownMenu(context);
          }
        },
      ),
    );
  }

  Widget buildDropdownMenu(BuildContext context,
      {List<EmployeeModel>? suppliers}) {
    return DropdownMenu(
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
      label: Text(S.of(context).UserName),
      onSelected: (value) {
        BlocProvider.of<ExportBillsCubit>(context)
            .get(userName: value.toString());
      },
      width: AppSizes.getWidth(310, context),
      dropdownMenuEntries: suppliers != null
          ? suppliers.map((supplier) {
              return DropdownMenuEntry(
                label: supplier.employeeName ?? "",
                value: supplier.employeeName,
              );
            }).toList()
          : const [],
    );
  }
}
