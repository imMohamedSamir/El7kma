import 'package:el7kma/Features/ExportBills/Presentaion/views/ExportBillsLaoding.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/manager/import_bills_cubit/import_bills_cubit.dart';
import 'package:el7kma/Features/ImportBillsView/Presentaion/views/ImportBillsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportBillsTable extends StatelessWidget {
  const ImportBillsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImportBillsCubit, ImportBillsState>(
      builder: (context, state) {
        if (state is ImportBillsSuccess) {
          final bills = state.bills;
          return Column(
            children: [
              ...List.generate(
                  bills.length,
                  (index) => ImportBillsCard(
                        bill: bills[index],
                      ))
            ],
          );
        } else if (state is ImportBillsLoading) {
          return const ExportLaoding();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
