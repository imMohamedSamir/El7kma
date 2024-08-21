import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesViewBody.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employeesview extends StatelessWidget {
  const Employeesview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmployeeCubit(getIt.get<EmployeeRepoImpl>())..get(),
      child: Scaffold(
        appBar: homeAppBar(context, title: "الموظفين"),
        body: const EmployeesViewBody(),
      ),
    );
  }
}
