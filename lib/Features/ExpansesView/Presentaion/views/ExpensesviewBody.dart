import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/manager/cubit/expenses_cubit.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpansesItemSec.dart';
import 'package:el7kma/Features/ExpansesView/Presentaion/views/ExpensesHeaderSec.dart';
import 'package:el7kma/Features/ExpansesView/data/repo/ExpensesRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ExpensesviewBody extends StatelessWidget {
  const ExpensesviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExpensesCubit(getIt.get<ExpensesRepoImpl>())..initial(),
      child: const SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpensesHeaderSec(),
                Gap(16),
                ExpansesItemSec(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
