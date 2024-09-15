import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomerHeaderSec extends StatelessWidget {
  const CustomerHeaderSec({super.key});
  static TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              label: S.of(context).CustomerName,
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                } else {}
              },
            ),
          ),
          _addIcon(context),
          const Spacer(),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _addIcon(BuildContext context) {
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
