import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/add_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellDropDownMenu extends StatelessWidget {
  const SellDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(6),
          child: DropdownMenu(
              onSelected: (value) {
                BlocProvider.of<AddItemCubit>(context).addItem(value ?? "null");
              },
              width: AppSizes.getWidth(210, context),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "value1", label: "label")
              ])),
    );
  }
}
