import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class DorRdropDown extends StatelessWidget {
  const DorRdropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        // enableFilter: true,
        requestFocusOnTap: false,
        enableSearch: false,
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
          ),
        ),
        initialSelection: true,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppStyles.styleSemiBold18(context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        label: Text(S.of(context).Type),
        onSelected: (value) {},
        width: AppSizes.getWidth(260, context),
        dropdownMenuEntries: const <DropdownMenuEntry<bool>>[
          DropdownMenuEntry(value: true, label: "مرتجع"),
          DropdownMenuEntry(value: false, label: "تالف"),
        ]);
  }
}
