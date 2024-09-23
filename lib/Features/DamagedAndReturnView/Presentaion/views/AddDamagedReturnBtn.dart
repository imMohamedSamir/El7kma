import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/DamagedAndReturnView/Presentaion/manager/cubit/damaged_retrun_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDamagedReturnBtn extends StatelessWidget {
  const AddDamagedReturnBtn({
    super.key,
    required this.cubit,
  });

  final DamagedRetrunCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DamagedRetrunCubit, DamagedRetrunState>(
      listener: (context, state) {
        if (state is DamagedRetrunSuccess) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierInvoiceSuccess);
        } else if (state is DamagedRetrunFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
      builder: (context, state) {
        if (state is DamagedRetrunLoading) {
          return const CircularProgressIndicator(color: pKcolor);
        }
        return CustomButton(
          txtcolor: Colors.white,
          btncolor: pKcolor,
          text: S.of(context).add,
          onPressed: () {
            cubit.addInvoice();
          },
        );
      },
    );
  }
}
