import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/ValidationMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/AddCustomerBtn.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key, this.controller});
  final TextEditingController? controller;
  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  late AddCustomerCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<AddCustomerCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerSuccess && widget.controller != null) {
          widget.controller!.text = cubit.customerModel.name ?? "";

          BlocProvider.of<CustomerCubit>(context).get();
          Navigator.pop(context);
        }
      },
      child: Form(
        key: cubit.key,
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
              onSaved: (value) {
                cubit.customerModel.name = value!.trim();
              },
            ),
            const Gap(16),
            CustomTextField(
                label: S.of(context).PhoneNumber,
                validator: (value) {
                  return Validationmethods.phoneNumber(context, value: value!);
                },
                onSaved: (value) {
                  cubit.customerModel.phoneNumber = value!.trim();
                }),
            const Gap(16),
            CustomTextField(
                label: S.of(context).Address,
                hintText: S.of(context).AddressMsg,
                onSaved: (value) {
                  cubit.customerModel.address = value?.trim();
                }),
            const Gap(16),
            const AddCustomerBtn(),
            const Gap(16),
            CustomButton(
              text: S.of(context).Cancel,
              txtcolor: pKcolor,
              btncolor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
