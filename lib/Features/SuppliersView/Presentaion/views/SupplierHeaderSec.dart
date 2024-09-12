import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/SupplierDropDownMenu.dart';
import 'package:flutter/material.dart';

class SupplierHeaderSec extends StatelessWidget {
  const SupplierHeaderSec({super.key});
  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          const SupplierDropDownMenu(),
          _addIcon(context),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _addIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Dialogmethods.addSupplier(context, controller);
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
