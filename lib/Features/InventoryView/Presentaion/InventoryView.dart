import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryviewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InventoryItemsCubit>(context).get();

    return Scaffold(
      appBar: homeAppBar(context, title: "المخزن"),
      body: const InventoryviewBody(),
    );
  }
}
