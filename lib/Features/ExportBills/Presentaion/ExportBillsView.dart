import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillsviewBody.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportRepImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportBillsView extends StatelessWidget {
  const ExportBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExportBillsCubit(getIt.get<ExportRepImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "فواتير البيع"),
        body: const ExportbillsviewBody(),
      ),
    );
  }
}
