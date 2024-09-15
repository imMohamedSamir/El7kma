import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/SupplierAddDeleteCubit/SupplierAddDeleteCubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/AddSupplierBtn.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddSupplierForm extends StatefulWidget {
  const AddSupplierForm({
    super.key,
  });

  @override
  State<AddSupplierForm> createState() => _AddSupplierFormState();
}

class _AddSupplierFormState extends State<AddSupplierForm> {
  late SupplierAddDeleteCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<SupplierAddDeleteCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          Text(S.of(context).AddSupplierMsg,
              style: AppStyles.styleMedium16(context)),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).SupplierName,
            validator: (p0) {
              if (p0!.isEmpty || p0.trim().isEmpty) {
                return S.of(context).SupplierNameValidator;
              }
              return null;
            },
            onSaved: (value) {
              cubit.suppliersModel.supplierName = value?.trim();
            },
          ),
          const Gap(16),
          CustomTextField(
            hintText: S.of(context).PhoneNumber,
            keyboardType: TextInputType.number,
            validator: (p0) {
              if (p0!.isEmpty || p0.trim().isEmpty) {
                return S.of(context).SupplierPhoneValidator;
              }
              if (p0.length < 11 || p0.length > 11) {
                return S.of(context).SupplierPhoneCorrect;
              }
              return null;
            },
            onSaved: (value) {
              cubit.suppliersModel.contactInfo = value?.trim();
            },
          ),
          const Gap(16),
          const AddSupplierBtn(),
          const Gap(16),
          CustomButton(
              text: S.of(context).Cancel,
              txtcolor: pKcolor,
              btncolor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
