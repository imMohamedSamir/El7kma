import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/SupplierAddDeleteCubit/SupplierAddDeleteCubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierHeaderSec.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierTable.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SuppliersViewBody extends StatelessWidget {
  const SuppliersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupplierAddDeleteCubit, SupplierDeleteState>(
      listener: (context, state) {
        if (state is SupplierAddSuccess) {
          Navigator.pop(context);
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierAddedMsg);
          BlocProvider.of<SuppliersCubit>(context).get();
        } else if (state is SupplierDeleteSuccess) {
          Navigator.pop(context);
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).SupplierDeletedMsg);
          BlocProvider.of<SuppliersCubit>(context).get();
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16),
                SupplierHeaderSec(),
                Gap(16),
                SupplierTable()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
