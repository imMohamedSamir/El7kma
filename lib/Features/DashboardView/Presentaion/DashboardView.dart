import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/manager/expenses_get_cubit/expenses_get_cubit.dart';
import 'package:el7kma/Features/DashboardView/Presentaion/views/DashboardViewBody.dart';
import 'package:el7kma/Features/OthersView/data/repo/ExpensesRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExpensesGetCubit(getIt.get<ExpensesRepoImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "الادارة"),
        body: const DashboardViewBody(),
      ),
    );
  }
}
