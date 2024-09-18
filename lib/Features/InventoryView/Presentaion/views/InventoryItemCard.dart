import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryPackageSec.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryItemCard extends StatefulWidget {
  const InventoryItemCard({super.key, required this.item});
  final Inventoryitemsmodel item;

  @override
  State<InventoryItemCard> createState() => _InventoryItemCardState();
}

class _InventoryItemCardState extends State<InventoryItemCard> {
  bool isEdit = false;
  late InventoryItemsCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<InventoryItemsCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            maxLines: 1,
            initialValue: widget.item.code,
            onChanged: (p0) {
              cubit.savedItem.code = p0;
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.item.product,
            onChanged: (p0) {
              cubit.savedItem.product = p0;
            },
          )),
          Expanded(
              child: CustomTextField(
            enabled: isEdit,
            initialValue: widget.item.qty.toString(),
            onChanged: (p0) {
              cubit.savedItem.qty = int.tryParse(p0);
            },
          )),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            enabled: isEdit,
            initialValue: widget.item.price.toString(),
            onChanged: (p0) {
              if (double.tryParse(p0) is num) {
                cubit.savedItem.price = double.parse(p0);
              }
            },
          )),
          InventoryPackageSec(
            isChecked: widget.item.isPackage ?? false,
            isEdit: isEdit,
            packageQty: widget.item.packageQty?.toInt() ?? 0,
          ),
          Expanded(
              child: CustomTextField(
            initialValue: widget.item.unitPrice.toString(),
            enabled: isEdit,
            isEGP: true,
            onChanged: (p0) {
              if (double.tryParse(p0) is num) {
                cubit.savedItem.unitPrice = double.parse(p0);
              }
            },
          )),
          if (!isEdit) editIcon(context) else saveIcon(context),
          deleteIcon(context)
        ],
      ),
    );
  }

  Widget editIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = true;
        });
        cubit.savedItem = widget.item;
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget saveIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = false;

          cubit.edit();
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: pKcolor),
        child: const Icon(
          Icons.save,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget deleteIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialogmethods.deleteItem(context, widget.item.id ?? "");
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.red),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
