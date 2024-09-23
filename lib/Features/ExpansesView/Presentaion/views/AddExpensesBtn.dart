import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/manager/cubit/expenses_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesBtn extends StatelessWidget {
  const AddExpensesBtn({
    super.key,
    required this.cubit,
  });

  final ExpensesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          BlocConsumer<ExpensesCubit, ExpensesState>(
            listener: (context, state) {
              if (state is ExpensesSuccess) {
                ScaffoldMsgMethod.showMsg(context,
                    msg: S.of(context).SupplierInvoiceSuccess);
              } else if (state is ExpensesFailure) {
                ScaffoldMsgMethod.showMsg(context,
                    isError: true, msg: S.of(context).ErrorMsg);
              }
            },
            builder: (context, state) {
              if (state is ExpensesLoading) {
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
          ),
        ],
      ),
    );
  }
}
