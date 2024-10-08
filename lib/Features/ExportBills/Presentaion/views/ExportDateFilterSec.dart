import 'package:el7kma/Core/Utlis/DialogMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/ExportBills/Presentaion/manager/cubit/export_bills_cubit.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ExportDateFilterSec extends StatefulWidget {
  const ExportDateFilterSec({super.key});

  @override
  State<ExportDateFilterSec> createState() => _ExportDateFilterSecState();
}

class _ExportDateFilterSecState extends State<ExportDateFilterSec> {
  late TextEditingController controller;
  late PickerDateRange dateRange;
  late ExportBillsCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<ExportBillsCubit>(context);
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CustomDateTextField(
        controller: controller,
        hint: S.of(context).Date,
        maxline: 2,
        onChanged: (p0) {
          if (p0.trim().isEmpty) {
            cubit.dateController.selectedRange = null;
            controller.clear(); // Clear the text in the controller
            cubit.get(); // Trigger the cubit to fetch data with no date filter
          }
        },
        onTap: () {
          Dialogmethods.dateTimeDialog(
            controller: cubit.dateController,
            context,
            onSubmit: (p0) {
              if (p0.runtimeType == PickerDateRange) {
                dateRange = p0 as PickerDateRange;
                String start = DateFormat('EEEE - yyyy/M/d ', 'ar')
                    .format(dateRange.startDate!);
                String end = DateFormat('EEEE - yyyy/M/d ', 'ar')
                    .format(dateRange.endDate ?? dateRange.startDate!);
                controller.text = "من :$start \nالى :$end";

                Navigator.pop(context);
                cubit.get();
              }
            },
          );
        },
      ),
    );
  }
}
