import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/add_item_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellItemRowSec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellItemsTable extends StatelessWidget {
  const SellItemsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SellItemRowSec();
    BlocBuilder<AddItemCubit, AddItemState>(
      builder: (context, state) {
        if (state is AddItemUpdated) {
          // List of widgets with index for deletion
          List<Widget> itemRows = state.items.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return SellItemRowSec(
              key: ValueKey(index), // Unique key for each item
              onDelete: () {
                context.read<AddItemCubit>().removeItem(index);
              },
            );
          }).toList();

          return Column(
            children: itemRows,
          );
        }

        return SellItemRowSec();
      },
    );
  }
}
