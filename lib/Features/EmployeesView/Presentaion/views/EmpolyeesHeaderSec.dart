import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/add_employee_cubit/add_employee_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpolyeesHeaderSec extends StatelessWidget {
  const EmpolyeesHeaderSec({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.getWidth(200, context),
      child: CustomButton(
        text: S.of(context).add,
        txtcolor: Colors.white,
        btncolor: pKcolor,
        onPressed: () {
          BlocProvider.of<AddEmployeeCubit>(context).initial();
          Dialogmethods.addEmployee(context);
        },
      ),
    );
  }
}
