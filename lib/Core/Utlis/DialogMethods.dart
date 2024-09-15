import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomDateTimeWidget.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/DialogBtn.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerForm.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeForm.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillstTable.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/SupplierAddDeleteCubit/SupplierAddDeleteCubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/AddSupplierForm.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          content: const CustomerForm(),
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

  static void showCustomerBills(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).CustomerBills,
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
        );
      },
    );
  }

  static void dateTimeDialog(BuildContext context,
      {dynamic Function(Object?)? onSubmit}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDateTimeWidget(
          onSubmit: onSubmit,
        );
      },
    );
  }
}
