import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class UserNameDropDownMenu extends StatelessWidget {
  const UserNameDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        label: Text(S.of(context).UserName),
        menuStyle: MenuStyle(
            shape: WidgetStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))))),
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        onSelected: (value) {},
        width: AppSizes.getWidth(290, context),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: "value1", label: "ali"),
          DropdownMenuEntry(value: "value1", label: "ahmed"),
          DropdownMenuEntry(value: "value1", label: "mahmoud"),
          DropdownMenuEntry(value: "value1", label: "mohsn"),
        ]);
  }
}
