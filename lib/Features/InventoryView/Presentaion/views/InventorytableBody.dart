import 'dart:developer';

import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryItemCard.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventorytableBody extends StatelessWidget {
  const InventorytableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InventoryItemsCubit, InventoryItemsState>(
      builder: (context, state) {
        if (state is InventoryItemsSuccess) {
          final items = state.items;
          log(items.length.toString());
          return ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return InventoryItemCard(
                item: items[index],
              );
            },
          );
        } else if (state is InventoryItemsLoading) {
          return const InventoryLoading();
        } else if (state is InventoryItemsFailure) {
          return const Center(
            child: Text('Error'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
