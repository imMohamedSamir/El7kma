import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class InventoryHeaderSec extends StatelessWidget {
  const InventoryHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(250, context),
      child: Column(
        children: [
          const Gap(16),
          CustomTextField(
            label: S.of(context).Code,
            onChanged: (value) {
              if (value.trim().isNotEmpty) {
                BlocProvider.of<InventoryItemsCubit>(context).get(code: value);
              } else {
                BlocProvider.of<InventoryItemsCubit>(context).get();
              }
            },
          ),
          const Gap(16),
          CustomTextField(
              label: S.of(context).Product,
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  BlocProvider.of<InventoryItemsCubit>(context)
                      .get(name: value);
                } else {
                  BlocProvider.of<InventoryItemsCubit>(context).get();
                }
              }),
        ],
      ),
    );
  }
}
