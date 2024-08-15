import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/Utlis/ValidationMethods.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeeForm extends StatelessWidget {
  const EmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            validator: (value) {
              return Validationmethods.phoneNumber(context, value: value!);
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).password,
            validator: (value) {
              return Validationmethods.employeePassword(context, value: value!);
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).Salary,
            isEGP: true,
            validator: (value) {
              return Validationmethods.employeeSalary(context, value: value!);
            },
          ),
        ],
      ),
    );
  }
}
