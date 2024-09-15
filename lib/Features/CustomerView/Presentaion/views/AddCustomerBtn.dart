import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCustomerBtn extends StatelessWidget {
  const AddCustomerBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCustomerCubit, AddCustomerState>(
      builder: (context, state) {
        if (state is AddCustomerLoading) {
          return const Center(child: CircularProgressIndicator(color: pKcolor));
        } else if (state is AddCustomerFailure) {
          String msg = state.errMsg;

          return Column(
            children: [
              Text(
                msg,
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: Colors.red),
              ),
              const Gap(16),
              CustomButton(
                text: S.of(context).add,
                txtcolor: Colors.white,
                btncolor: pKcolor,
                onPressed: () {
                  BlocProvider.of<AddCustomerCubit>(context).add();
                },
              )
            ],
          );
        }
        return CustomButton(
            text: S.of(context).add,
            txtcolor: Colors.white,
            btncolor: pKcolor,
            onPressed: () {
              BlocProvider.of<AddCustomerCubit>(context).add();
            });
      },
    );
  }
}
