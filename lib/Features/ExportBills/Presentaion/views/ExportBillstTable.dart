import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillCard.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillsLaoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExportBillstTable extends StatelessWidget {
  const ExportBillstTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportBillsCubit, ExportBillsState>(
      builder: (context, state) {
        if (state is ExportBillsSuccess) {
          final bills = state.bills;
          return Column(
            children: [
              ...List.generate(
                  bills.length, (index) => ExportBillCard(bill: bills[index]))
            ],
          );
        } else if (state is ExportBillsLoading) {
          return const ExportLaoding();
        } else {
          return const Center(child: Text('No Data'));
        }
      },
    );
  }
}
