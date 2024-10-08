import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Core/widgets/CustomDateTimeWidget.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/DialogBtn.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerForm.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/manager/expenses_get_cubit/expenses_get_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeForm.dart';
import 'package:el7kma/Features/ExpensesBillsView/Presentaion/views/ExpensesTable.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillstTable.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/UserNameDropDownMenu.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepoImpl.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/manager/import_bills_cubit/import_bills_cubit.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsTable.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepoImpl.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/OthersView/data/repo/ExpensesRepoImpl.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/SupplierAddDeleteCubit/SupplierAddDeleteCubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/AddSupplierForm.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

abstract class Dialogmethods {
  static void addSupplier(
      BuildContext context, TextEditingController controler) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).AddSupplier,
              style: AppStyles.styleMedium18(context)),
          content: const AddSupplierForm(),
        );
      },
    );
  }

  static void addEmployee(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).AddEmployee,
              style: AppStyles.styleSemiBold18(context)),
          content: const EmployeeForm(),
        );
      },
    );
  }

  static void addCustomer(
      BuildContext context, TextEditingController? controller) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).AddCustomer,
              style: AppStyles.styleSemiBold18(context)),
          content: CustomerForm(
            controller: controller,
          ),
        );
      },
    );
  }

  static void deleteEmployee(BuildContext context, String id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).DeleteEmployee,
              style: AppStyles.styleSemiBold18(context)),
          content: Text(S.of(context).DeleteEmployeeMsg,
              style: AppStyles.styleMedium18(context)),
          actions: [
            DialogBtn(
              text: S.of(context).Delete,
              txtColor: Colors.white,
              btnColor: const Color.fromARGB(255, 182, 14, 14),
              onPressed: () {
                BlocProvider.of<EmployeeCubit>(context).delete(id: id);
                Navigator.of(context).pop();
              },
            ),
            DialogBtn(
              text: S.of(context).Cancel,
              txtColor: pKcolor,
              btnColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void deleteSupplier(BuildContext context, String id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).DeleteSupplier,
              style: AppStyles.styleSemiBold18(context)),
          content: Text(S.of(context).DeleteSupplierMsg,
              style: AppStyles.styleMedium18(context)),
          actions: [
            DialogBtn(
              text: S.of(context).Delete,
              txtColor: Colors.white,
              btnColor: const Color.fromARGB(255, 182, 14, 14),
              onPressed: () {
                BlocProvider.of<SupplierAddDeleteCubit>(context).delete(id: id);
              },
            ),
            DialogBtn(
              text: S.of(context).Cancel,
              txtColor: pKcolor,
              btnColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void deleteItem(BuildContext context, String id) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).DeleteItem,
              style: AppStyles.styleSemiBold18(context)),
          content: Text(S.of(context).DeleteItemMsg,
              style: AppStyles.styleMedium18(context)),
          actions: [
            DialogBtn(
              text: S.of(context).Delete,
              txtColor: Colors.white,
              btnColor: const Color.fromARGB(255, 182, 14, 14),
              onPressed: () {
                BlocProvider.of<InventoryItemsCubit>(context).delete(id: id);
                Navigator.pop(context);
              },
            ),
            DialogBtn(
              text: S.of(context).Cancel,
              txtColor: pKcolor,
              btnColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void deleteCustomer(BuildContext context, {required String id}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).DeleteCustomer,
              style: AppStyles.styleSemiBold18(context)),
          content: Text(S.of(context).DeleteCustomerMsg,
              style: AppStyles.styleMedium18(context)),
          actions: [
            DialogBtn(
              text: S.of(context).Delete,
              txtColor: Colors.white,
              btnColor: const Color.fromARGB(255, 182, 14, 14),
              onPressed: () {
                BlocProvider.of<AddCustomerCubit>(context).delete(id: id);
              },
            ),
            DialogBtn(
              text: S.of(context).Cancel,
              txtColor: pKcolor,
              btnColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void showCustomerBills(BuildContext context,
      {required String customerName}) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) =>
              ExportBillsCubit(getIt.get<ExportBillsRepoImpl>())
                ..get(customerName: customerName),
          child: AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${S.of(context).CustomerBills} : $customerName",
                    style: AppStyles.styleSemiBold18(context)),
                const Spacer(),
                Expanded(
                  child: CustomDateTextField(
                    controller: controller,
                    hint: S.of(context).Date,
                    maxline: 2,
                    onTap: () {
                      // Dialogmethods.dateTimeDialog(context,
                      //     controller: controller);
                    },
                  ),
                )
              ],
            ),
            content: SizedBox(
                height: AppSizes.getHeight(800, context),
                width: AppSizes.getWidth(1000, context),
                child: const SingleChildScrollView(child: ExportBillstTable())),
          ),
        );
      },
    );
  }

  static void showSupplierBills(BuildContext context,
      {required String supplierName}) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) =>
              ImportBillsCubit(getIt.get<ImportBillsRepoImpl>())
                ..get(supplierName: supplierName),
          child: AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(supplierName, style: AppStyles.styleSemiBold18(context)),
                const Spacer(),
                Expanded(
                  child: CustomDateTextField(
                    controller: controller,
                    hint: S.of(context).Date,
                    maxline: 2,
                    onTap: () {
                      // Dialogmethods.dateTimeDialog(context,
                      //     controller: controller);
                    },
                  ),
                )
              ],
            ),
            content: SizedBox(
                height: AppSizes.getHeight(800, context),
                width: AppSizes.getWidth(1000, context),
                child: const SingleChildScrollView(child: ImportBillsTable())),
          ),
        );
      },
    );
  }

  static void showExpensesBills(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        // Use dialogContext for the dialog
        return BlocProvider(
          create: (context) =>
              ExpensesGetCubit(getIt.get<ExpensesRepoImpl>())..get(),
          child: AlertDialog(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(
                  // Wrap in Builder to get the correct context
                  builder: (BuildContext blocContext) {
                    return UserNameDropDownMenu(
                      onSelected: (value) {
                        BlocProvider.of<ExpensesGetCubit>(blocContext)
                            .get(employeeName: value.toString());
                      },
                    );
                  },
                ),
                const Spacer(),
                Expanded(
                  child: CustomDateTextField(
                    controller: controller,
                    hint: S.of(context).Date,
                    maxline: 2,
                    onTap: () {
                      // Dialogmethods.dateTimeDialog(context, controller: controller);
                    },
                  ),
                ),
              ],
            ),
            content: SizedBox(
              height: AppSizes.getHeight(800, context),
              width: AppSizes.getWidth(1000, context),
              child: const SingleChildScrollView(child: ExpensesTable()),
            ),
          ),
        );
      },
    );
  }

  static void outOfStockItemDialog(BuildContext context,
      {required String msg}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon:
              const Icon(Icons.warning_rounded, color: Colors.orange, size: 42),
          title: Text(S.of(context).OutOfStockItem,
              style: AppStyles.styleSemiBold20(context)),
          content: Row(
            children: [
              Text(msg,
                  style: AppStyles.styleMedium18(context)
                      .copyWith(color: Colors.red)),
              Text(" , ${S.of(context).OutOfStockItemMsg}",
                  style: AppStyles.styleMedium18(context)),
            ],
          ),
        );
      },
    );
  }

  static void outOfStockWarningDialog(BuildContext context,
      {required String item, required int qty}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon:
              const Icon(Icons.warning_rounded, color: Colors.orange, size: 42),
          title: Text(S.of(context).OutOfStockWarning,
              style: AppStyles.styleSemiBold20(context)),
          content: Row(
            children: [
              Text(item,
                  style: AppStyles.styleMedium18(context)
                      .copyWith(color: Colors.red)),
              Text(", ${S.of(context).OutOfStockWarningMsg}",
                  style: AppStyles.styleMedium18(context)),
              Text(": ${qty.toString()}",
                  style: AppStyles.styleMedium18(context)
                      .copyWith(color: Colors.orange)),
            ],
          ),
        );
      },
    );
  }

  static void dateTimeDialog(BuildContext context,
      {dynamic Function(Object?)? onSubmit,
      DateRangePickerController? controller}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDateTimeWidget(
          onSubmit: onSubmit,
          controller: controller,
        );
      },
    );
  }
}
