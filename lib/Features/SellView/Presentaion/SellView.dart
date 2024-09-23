import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/InventoryView/Presentaion/manager/inventory_items_cubit/inventory_items_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/manager/cubit/export_invoice_cubit.dart';
import 'package:el7kma/Features/SellView/Presentaion/views/SellviewBody.dart';
import 'package:el7kma/Features/SellView/data/repo/ExportRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellView extends StatelessWidget {
  const SellView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<InventoryItemsCubit>(context).get(pageSize: 1000);
    return BlocProvider(
      create: (context) =>
          ExportInvoiceCubit(getIt.get<ExportRepoImpl>())..initial(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "البيع"),
        body: const SellviewBody(),
      ),
    );
  }
}
