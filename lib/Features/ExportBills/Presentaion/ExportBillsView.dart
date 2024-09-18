import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepoImpl.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportbillsviewBody.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportBillsView extends StatelessWidget {
  const ExportBillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ExportBillsCubit(getIt.get<ExportBillsRepoImpl>())..get(),
        ),
        BlocProvider(
          create: (context) =>
              EmployeeCubit(getIt.get<EmployeeRepoImpl>())..get(),
        ),
      ],
      child: Scaffold(
        appBar: homeAppBar(context, title: "فواتير البيع"),
        body: const ExportbillsviewBody(),
      ),
    );
  }
}
