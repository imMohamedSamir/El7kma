import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class SupplierDropDownMenu extends StatelessWidget {
  const SupplierDropDownMenu({
    super.key,
  });
  static TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        controller: controller,
        label: Text(S.of(context).SupplierName),
        onSelected: (value) {
          if (value == "add") {
            Dialogmethods.addSupplier(context, controller);
          }
        },
        width: AppSizes.getWidth(310, context),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: "value1", label: "ali"),
          DropdownMenuEntry(value: "value1", label: "ahmed"),
          DropdownMenuEntry(value: "value1", label: "mahmoud"),
          DropdownMenuEntry(value: "value1", label: "mohsn"),
          DropdownMenuEntry(
              value: "add", label: "اضافة", trailingIcon: Icon(Icons.add))
        ]);
  }
}
