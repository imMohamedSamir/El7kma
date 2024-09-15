import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/ImportView/Presentaion/manager/cubit/import_item_cubit.dart';
import 'package:el7kma/Features/ImportView/Presentaion/views/ImportviewBody.dart';
import 'package:el7kma/Features/ImportView/data/repo/ImportRepoImpl.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportView extends StatelessWidget {
  const ImportView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SuppliersCubit(getIt.get<SupplierRpoImpl>())..get(),
        ),
        BlocProvider(
            create: (context) =>
                ImportItemCubit(getIt.get<ImportRepoImpl>())..initial()),
      ],
      child: Scaffold(
        appBar: homeAppBar(context, title: "الوارد"),
        body: const ImportviewBody(),
      ),
    );
  }
}
