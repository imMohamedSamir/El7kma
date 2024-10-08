import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddImportBtn extends StatelessWidget {
  const AddImportBtn({
    super.key,
    required this.cubit,
  });

  final ImportItemCubit cubit;

  Widget build(BuildContext context) {
    return BlocConsumer<ImportItemCubit, ImportItemState>(
      listener: (context, state) {
        if (state is ImportItemSuccess) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierInvoiceSuccess);
          BlocProvider.of<InventoryItemsCubit>(context).get();
        } else if (state is ImportItemFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
      builder: (context, state) {
        if (state is ImportItemLoadign) {
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
