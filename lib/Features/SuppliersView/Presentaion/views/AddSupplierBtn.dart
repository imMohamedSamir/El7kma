import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/SupplierAddDeleteCubit/SupplierAddDeleteCubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddSupplierBtn extends StatelessWidget {
  const AddSupplierBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplierAddDeleteCubit, SupplierDeleteState>(
      builder: (context, state) {
        if (state is SupplierDeleteLoading) {
          return const Center(child: CircularProgressIndicator(color: pKcolor));
        } else if (state is SupplierDeleteFailure) {
          return Column(
            children: [
              Text(
                S.of(context).ErrorMsg,
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: Colors.red),
              ),
              const Gap(16),
              CustomButton(
                text: S.of(context).add,
                txtcolor: Colors.white,
                btncolor: scColor,
                onPressed: () {
                  BlocProvider.of<SupplierAddDeleteCubit>(context).add();
                },
              )
            ],
          );
        }
        return CustomButton(
          text: S.of(context).add,
          txtcolor: Colors.white,
          btncolor: scColor,
          onPressed: () {
            BlocProvider.of<SupplierAddDeleteCubit>(context).add();
          },
        );
      },
    );
  }
}
