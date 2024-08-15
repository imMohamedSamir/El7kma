import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeCard.dart';
import 'package:flutter/material.dart';

class EmployeesTableBody extends StatelessWidget {
  const EmployeesTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [EmployeeCard()],
    );
  }
}
