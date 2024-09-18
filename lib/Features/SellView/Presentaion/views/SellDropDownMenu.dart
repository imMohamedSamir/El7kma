import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SellDropDownMenu extends StatelessWidget {
  const SellDropDownMenu(
      {super.key,
      this.isCode = false,
      this.value,
      this.onSelected,
      this.controller,
      this.focusNode});
  final bool isCode;
  final String? value;
  final void Function(Object?)? onSelected;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);

    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(6),
      child: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, dynamic value, Widget? child) {
          final items = box.values.toList();
          if (items.isNotEmpty) {
            return buildDropdownMenu(context, items: items);
          } else {
            return buildDropdownMenu(context);
          }
        },
      ),
    ));
  }

  Widget buildDropdownMenu(BuildContext context,
      {List<Inventoryitemsmodel>? items}) {
    return DropdownMenu<String>(
      focusNode: focusNode,
      controller: controller,
      enableFilter: true,
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
      initialSelection: value ?? "",
      textStyle: AppStyles.styleSemiBold20(context),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onSelected: onSelected,
      width: AppSizes.getWidth(210, context),
      dropdownMenuEntries: items != null
          ? items.map((item) {
              return DropdownMenuEntry(
                label: isCode ? item.code ?? "" : item.product ?? "",
                value: isCode ? item.code ?? "" : item.product ?? "",
              );
            }).toList()
          : const [],
    );
  }
}
