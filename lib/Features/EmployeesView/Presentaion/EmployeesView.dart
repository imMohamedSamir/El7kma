import 'package:el7kma/Core/Utlis/AppBarMethod.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesViewBody.dart';
import 'package:flutter/material.dart';

class Employeesview extends StatelessWidget {
  const Employeesview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context, title: "الموظفين"),
      body: const EmployeesViewBody(),
    );
  }
}
