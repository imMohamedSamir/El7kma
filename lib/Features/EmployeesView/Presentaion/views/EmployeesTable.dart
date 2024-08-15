import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesTableBody.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesTableHeader.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeesTable extends StatelessWidget {
  const EmployeesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: const Color(0xffEFF1F2),
            borderRadius: BorderRadius.circular(16)),
        child: const Column(
          children: [
            EmployeesTableHeader(),
            EmployeesTableBody(),
            Gap(16),
          ],
        ),
      ),
    );
  }
}
