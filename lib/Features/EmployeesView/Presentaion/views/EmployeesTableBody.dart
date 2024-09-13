import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/employee_cubit/employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeCard.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeLoading.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesTableBody extends StatelessWidget {
  const EmployeesTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmployeeCubit, EmployeeState>(
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
      listener: (BuildContext context, EmployeeState state) {
        if (state is EmployeeEdited) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).EmployeeEditedMsg);
        } else if (state is EmployeeDeleted) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).EmployeeDeletedMsg);
        } else if (state is EmployeeFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
    );
  }
}
