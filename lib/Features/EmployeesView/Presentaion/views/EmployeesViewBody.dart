import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeesTable.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmpolyeesHeaderSec.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeesViewBody extends StatelessWidget {
  const EmployeesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              EmpolyeesHeaderSec(),
              Gap(16),
              EmployeesTable()
            ],
          ),
        ),
      ),
    );
  }
}
