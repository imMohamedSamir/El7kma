import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryPackageSec.dart';
import 'package:flutter/material.dart';

class InventoryItemCard extends StatefulWidget {
  const InventoryItemCard({super.key});

  @override
  State<InventoryItemCard> createState() => _InventoryItemCardState();
}

class _InventoryItemCardState extends State<InventoryItemCard> {
  bool isEdit = false;
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
          maxLines: 1,
        )),
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
        )),
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
        )),
        Expanded(
            child: CustomTextField(
          isEGP: true,
          enabled: isEdit,
        )),
        InventoryPackageSec(isChecked: true, isEdit: isEdit),
        Expanded(
            child: CustomTextField(
          enabled: isEdit,
          isEGP: true,
        )),
        if (!isEdit) editIcon(context) else saveIcon(context),
        deleteIcon(context)
      ],
    );
  }

  Widget editIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEdit = true;
        });
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
        Dialogmethods.deleteItem(context);
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
