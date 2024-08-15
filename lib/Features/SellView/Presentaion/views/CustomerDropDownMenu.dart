import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomerDropDownMenu extends StatelessWidget {
  const CustomerDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        label: Text(S.of(context).CustomerName),
        onSelected: (value) {
          if (value == "add") {
            // Dialogmethods.addSupplier(context, controller);
          }
        },
        width: AppSizes.getWidth(290, context),
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
