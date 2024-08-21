import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeCard.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeLoading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesTableBody extends StatelessWidget {
  const EmployeesTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      builder: (context, state) {
        if (state is EmployeeSuccess) {
          final employees = state.employees;
          return Column(
            children: [
              ...List.generate(employees.length,
                  (index) => EmployeeCard(employeeModel: employees[index]))
            ],
          );
        } else if (state is EmployeeLoading) {
          return const EmployeeLoadingBuilder();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
