import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/edit_item_cubit/edit_item_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/views/InventoryviewBody.dart';
import 'package:el7kma/Features/InventoryView/data/repo/InvenetoryRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoryView extends StatelessWidget {
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InventoryItemsCubit(getIt.get<InvenetoryRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) => EditItemCubit(getIt.get<InvenetoryRepoImpl>()),
        ),
      ],
      child: Scaffold(
        appBar: homeAppBar(context, title: "المخزن"),
        body: const InventoryviewBody(),
      ),
    );
  }
}
