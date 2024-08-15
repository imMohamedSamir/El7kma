import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellDropDownMenu.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemsQty.dart';
import 'package:flutter/material.dart';

class SellItemRowSec extends StatelessWidget {
  const SellItemRowSec({super.key, this.onDelete});
  final void Function()? onDelete;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        child: const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        if (onDelete != null) {
          onDelete!();
        }
      },
      child: Row(
        children: [
          const SellDropDownMenu(),
          const SellDropDownMenu(),
          Expanded(
              child: CustomTextField(
            isEGP: true,
          )),
          const SellItemsQty(),
          Expanded(
              child: CustomTextField(
            isEGP: true,
            enabled: false,
          )),
        ],
      ),
    );
  }
}
