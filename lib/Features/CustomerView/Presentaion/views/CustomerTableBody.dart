import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerCard.dart';
import 'package:el7kma/Features/EmployeesView/Presentaion/views/EmployeeLoading.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTableBody extends StatelessWidget {
  const CustomerTableBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
      builder: (context, state) {
        if (state is CustomerSuccess) {
          final customers = state.customers;
          return Column(
            children: [
              ...List.generate(
                  customers.length,
                  (index) => CustomerCard(
                        customer: customers[index],
                      ))
            ],
          );
        } else if (state is CustomerLaoding) {
          return const EmployeeLoadingBuilder();
        } else {
          return const SizedBox();
        }
      },
      listener: (BuildContext context, CustomerState state) {
        if (state is CustomerEdited) {
          BlocProvider.of<CustomerCubit>(context).get();
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).CustomerEditeMsg);
        } else if (state is CustomerFailure) {
          BlocProvider.of<CustomerCubit>(context).get();
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).ErrorMsg);
        }
      },
    );
  }
}
