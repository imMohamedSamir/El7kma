import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/manager/import_bills_cubit/import_bills_cubit.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsBody.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportBillsView extends StatelessWidget {
  const ImportBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ImportBillsCubit(getIt.get<ImportBillsRepoImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "فواتير الواردات"),
        body: const ImportBillsBody(),
      ),
    );
  }
}
