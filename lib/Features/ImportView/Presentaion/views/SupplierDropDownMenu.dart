import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class SupplierDropDownMenu extends StatelessWidget {
  const SupplierDropDownMenu({
    super.key,
    this.isBill = false,
  });
  static TextEditingController controller = TextEditingController();
  final bool isBill;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        menuStyle: MenuStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))))),
        controller: controller,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        label: Text(S.of(context).SupplierName),
        onSelected: (value) {
          if (value == "add") {
            Dialogmethods.addSupplier(context, controller);
          }
        },
        width: AppSizes.getWidth(isBill ? 290 : 310, context),
        dropdownMenuEntries: [
          const DropdownMenuEntry(value: "value1", label: "ali"),
          const DropdownMenuEntry(value: "value1", label: "ahmed"),
          const DropdownMenuEntry(value: "value1", label: "mahmoud"),
          const DropdownMenuEntry(value: "value1", label: "mohsn"),
          if (!isBill)
            const DropdownMenuEntry(
                value: "add", label: "اضافة", trailingIcon: Icon(Icons.add))
        ]);
  }
}
