import 'package:el7kma/Core/Utlis/scaffoldMsgMethod.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/add_customer_cubit/add_customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/manager/customer_cubit/customer_cubit.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerHeaderSec.dart';
import 'package:el7kma/Features/CustomerView/Presentaion/views/CustomerTable.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCustomerCubit, AddCustomerState>(
      listener: (context, state) {
        if (state is AddCustomerDeleted) {
          Navigator.pop(context);
          ScaffoldMsgMethod.showMsg(context,
              isError: true, msg: S.of(context).CustomerDeleteMsg);
          BlocProvider.of<CustomerCubit>(context).get();
        } else if (state is AddCustomerSuccess) {
          Navigator.pop(context);
          ScaffoldMsgMethod.showMsg(context,
              msg: S.of(context).CustomerAddedMsg);
          BlocProvider.of<CustomerCubit>(context).get();
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [CustomerHeaderSec(), Gap(16), CustomerTable()],
            ),
          ),
        ),
      ),
    );
  }
}
