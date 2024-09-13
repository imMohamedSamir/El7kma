import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/Utlis/ValidationMethods.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/add_employee_cubit/add_employee_cubit.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/AddEmployeeBtn.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  late AddEmployeeCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<AddEmployeeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).AddEmployeeMsg,
              style: AppStyles.styleMedium16(context)),
          const Gap(16),
          CustomTextField(
            label: S.of(context).EmployeeName,
            validator: (value) {
              return Validationmethods.employeeName(context, value: value!);
            },
            onSaved: (value) {
              cubit.employeeModel.name = value!.trim();
              cubit.employeeModel.userName = value.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            validator: (value) {
              return Validationmethods.phoneNumber(context, value: value!);
            },
            onSaved: (value) {
              cubit.employeeModel.email = value!.trim();
              cubit.employeeModel.phoneNumber = value.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).password,
            validator: (value) {
              return Validationmethods.employeePassword(context, value: value!);
            },
            onSaved: (value) {
              cubit.employeeModel.password = value!.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).Salary,
            isEGP: true,
            validator: (value) {
              return Validationmethods.employeeSalary(context, value: value!);
            },
            onSaved: (value) {
              cubit.employeeModel.salary = double.tryParse(value!.trim());
            },
          ),
          const Gap(16),
          const AddEmployeeBtn(),
          const Gap(16),
          CustomButton(
              text: S.of(context).Cancel,
              txtcolor: pKcolor,
              btncolor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }
}
