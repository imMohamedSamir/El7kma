import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/manager/add_employee_cubit/add_employee_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddEmployeeBtn extends StatelessWidget {
  const AddEmployeeBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddEmployeeCubit, AddEmployeeState>(
      listener: (context, state) {
        if (state is AddEmployeeSuccess) {
          ScaffoldMsgMethod.showMsg(context, msg: "done");
        }
      },
      builder: (context, state) {
        if (state is AddEmployeeLoading) {
          return const Center(child: CircularProgressIndicator(color: pKcolor));
        } else if (state is AddEmployeeFailure) {
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
                btncolor: scColor,
                onPressed: () {
                  BlocProvider.of<AddEmployeeCubit>(context).add();
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
            BlocProvider.of<AddEmployeeCubit>(context).add();
          },
        );
      },
    );
  }
}
