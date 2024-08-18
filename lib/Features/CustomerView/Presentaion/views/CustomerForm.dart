import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/ValidationMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerForm extends StatelessWidget {
  const CustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).AddCustomerMsg,
              style: AppStyles.styleMedium16(context)),
          const Gap(16),
          CustomTextField(
            label: S.of(context).CustomerName,
            validator: (value) {
              return Validationmethods.customerName(context, value: value!);
            },
          ),
          const Gap(16),
          CustomTextField(
            label: S.of(context).PhoneNumber,
            validator: (value) {
              return Validationmethods.phoneNumber(context, value: value!);
            },
          ),
        ],
      ),
    );
  }
}
