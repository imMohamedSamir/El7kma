import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExportBtn extends StatelessWidget {
  const AddExportBtn({super.key, required this.cubit});

  final ExportInvoiceCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExportInvoiceCubit, ExportInvoiceState>(
      listener: (context, state) {
        if (state is ExportInvoiceSuccess) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierInvoiceSuccess);
          BlocProvider.of<InventoryItemsCubit>(context).get();
        } else if (state is ExportInvoiceFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        } else if (state is ExportInvoiceOutOfStock) {
          Dialogmethods.outOfStockItemDialog(context, msg: state.itemName);
        }
      },
      builder: (context, state) {
        if (state is ExportInvoiceLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        }
        return CustomButton(
          txtcolor: Colors.white,
          btncolor: pKcolor,
          text: S.of(context).add,
          onPressed: () {
            cubit.addInvoice();
          },
        );
      },
    );
  }
}
