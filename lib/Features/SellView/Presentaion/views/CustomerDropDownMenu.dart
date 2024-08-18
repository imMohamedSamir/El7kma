import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomerDropDownMenu extends StatelessWidget {
  const CustomerDropDownMenu({super.key, this.isCustomer = false});
  final bool isCustomer;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return DropdownMenu(
        controller: controller,
        menuStyle: MenuStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))))),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        label: Text(S.of(context).CustomerName),
        onSelected: (value) {
          if (value == "add") {
            Dialogmethods.addCustomer(context, controller);
          }
        },
        width: AppSizes.getWidth(290, context),
        dropdownMenuEntries: [
          const DropdownMenuEntry(value: "value1", label: "ali"),
          const DropdownMenuEntry(value: "value1", label: "ahmed"),
          const DropdownMenuEntry(value: "value1", label: "mahmoud"),
          const DropdownMenuEntry(value: "value1", label: "mohsn"),
          if (!isCustomer)
            const DropdownMenuEntry(
                value: "add", label: "اضافة", trailingIcon: Icon(Icons.add))
        ]);
  }
}
