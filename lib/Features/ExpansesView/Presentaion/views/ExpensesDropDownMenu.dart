import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class ExpensesDropDownMenu extends StatelessWidget {
  const ExpensesDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        label: Text(S.of(context).ExpensesType),
        onSelected: (value) {},
        width: AppSizes.getWidth(290, context),
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: "value1", label: "خاص"),
          DropdownMenuEntry(value: "value1", label: "تالف"),
          DropdownMenuEntry(value: "value1", label: "لله"),
          DropdownMenuEntry(value: "value1", label: "مصاريف"),
        ]);
  }
}
