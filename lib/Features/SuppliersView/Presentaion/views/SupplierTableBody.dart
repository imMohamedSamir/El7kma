import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeLoading.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/manager/suppliers_cubit/suppliers_cubit.dart';
import 'package:el7kma/Features/SuppliersView/Presentaion/views/SupplierCard.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupplierTableBody extends StatelessWidget {
  const SupplierTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuppliersCubit, SuppliersState>(
      builder: (context, state) {
        if (state is SuppliersSuccess) {
          final suppliers = state.suppliers;
          return Column(
            children: [
              ...List.generate(
                  suppliers.length,
                  (index) => SupplierCard(
                        supplier: suppliers[index],
                      ))
            ],
          );
        } else if (state is SuppliersLoading) {
          return const EmployeeLoadingBuilder();
        } else {
          return const SizedBox();
        }
      },
      listener: (BuildContext context, SuppliersState state) {
        if (state is SuppliersEdited) {
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).SupplierEditedMsg);
        } else if (state is SuppliersFailure) {
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
    );
  }
}
