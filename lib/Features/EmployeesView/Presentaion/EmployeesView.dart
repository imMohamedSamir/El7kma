import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Employeesview extends StatelessWidget {
  const Employeesview({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<EmployeeCubit>(context).get();
    return Scaffold(
      appBar: homeAppBar(context, title: "الموظفين"),
      body: const EmployeesViewBody(),
    );
  }
}
