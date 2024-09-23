import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/AddExportBtn.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/CustomerDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellTotalSec.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SellHeaderSec extends StatelessWidget {
  const SellHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ExportInvoiceCubit>(context);
    return BlocListener<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerSuccess) {
          BlocProvider.of<ExportInvoiceCubit>(context).invoice.customerId =
              state.id;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomTextField(
                    controller: cubit.billNoController,
                    label: S.of(context).BillNo,
                    enabled: false,
                  ),
                  const Gap(16),
                  Row(
                    children: [
                      Expanded(
                          child: CustomerDropDownMenu(
                        controller: cubit.customerController,
                        onSelected: (value) {
                          BlocProvider.of<ExportInvoiceCubit>(context)
                              .invoice
                              .customerId = value.toString();
                        },
                      )),
                      _addIcon(context, cubit.customerController)
                    ],
                  ),
                  const Gap(22),
                  CustomTextField(
                    controller: cubit.discountController,
                    hintText: S.of(context).Discount,
                    isEGP: true,
                    onChanged: (value) {
                      cubit.updateDiscountedTotal();
                    },
                  ),
                ],
              ),
            ),
            const Gap(16),
            SellTotalSec(),
            const Gap(16),
            Expanded(
              child: Column(
                children: [
                  CustomTextField(
                    hintText: S.of(context).Notes,
                    maxLines: 4,
                    onChanged: (value) {
                      if (value.trim().isNotEmpty) {
                        cubit.invoice.notes = value.trim();
                      }
                    },
                  ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                children: [
                  AddExportBtn(cubit: cubit),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _addIcon(BuildContext context, TextEditingController controller) {
    return InkWell(
      onTap: () {
        Dialogmethods.addCustomer(context, controller);
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
