import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryPackageSec extends StatefulWidget {
  const InventoryPackageSec(
      {super.key,
      this.isChecked = false,
      this.isEdit = false,
      this.isUser = false,
      required this.packageQty});
  final bool isChecked, isEdit, isUser;
  final int packageQty;
  @override
  State<InventoryPackageSec> createState() => _InventoryPackageSecState();
}

class _InventoryPackageSecState extends State<InventoryPackageSec> {
  bool checked = false;
  late InventoryItemsCubit cubit;

  @override
  void initState() {
    checked = widget.isChecked;
    cubit = BlocProvider.of<InventoryItemsCubit>(context);
    cubit.savedItem.isPackage = checked;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: [
          Expanded(
              child: Checkbox(
            fillColor: widget.isUser && widget.isChecked
                ? WidgetStateProperty.all<Color>(pKcolor)
                : null,
            activeColor: pKcolor,
            value: checked,
            onChanged: widget.isUser || !widget.isEdit
                ? null
                : (value) {
                    setState(() {
                      checked = !checked;
                      cubit.savedItem.isPackage = checked;
                    });
                  },
          )),
          if (widget.isUser)
            Expanded(
                child: CustomTextField(
              enabled: false,
              initialValue: widget.packageQty.toString(),
              onSaved: (p0) {
                if (int.tryParse(p0!) is num) {
                  // cubit.savedItem.packageQty = int.parse(p0);
                }
              },
            ))
          else
            Expanded(
                child: CustomTextField(
                    initialValue: widget.packageQty.toString(),
                    enabled: widget.isEdit,
                    keyboardType: TextInputType.number,
                    onSaved: (p0) {
                      if (int.tryParse(p0!) is num) {
                        // cubit.savedItem.packageQty = int.parse(p0);
                      }
                    })),
        ],
      ),
    );
  }
}
