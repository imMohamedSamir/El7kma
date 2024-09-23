import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/manager/cubit/damaged_retrun_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DorRdropDown extends StatelessWidget {
  const DorRdropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<DamagedRetrunCubit>(context);

    return DropdownMenu(
        controller: cubit.typeController,
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
        initialSelection: "return",
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: AppStyles.styleSemiBold18(context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        label: Text(S.of(context).Type),
        onSelected: (value) {
          cubit.invoice.type = value ?? "";
        },
        width: AppSizes.getWidth(260, context),
        dropdownMenuEntries: const <DropdownMenuEntry<String>>[
          DropdownMenuEntry(value: "return", label: "مرتجع"),
          DropdownMenuEntry(value: "damaged", label: "تالف"),
        ]);
  }
}
