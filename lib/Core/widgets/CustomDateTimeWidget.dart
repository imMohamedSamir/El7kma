import 'dart:developer';

import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateTimeWidget extends StatelessWidget {
  const CustomDateTimeWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    late PickerDateRange dateRange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 550, vertical: 220),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: SfDateRangePicker(
        showActionButtons: true,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
        selectionMode: DateRangePickerSelectionMode.range,
        cancelText: S.of(context).Cancel,
        confirmText: S.of(context).OK,
        onSubmit: (p0) {
          if (p0.runtimeType == PickerDateRange) {
            dateRange = p0 as PickerDateRange;
            String start = DateFormat('EEEE - yyyy/M/d ', 'ar')
                .format(dateRange.startDate!);
            String end =
                DateFormat('EEEE - yyyy/M/d ', 'ar').format(dateRange.endDate!);
            controller.text = "من :$start \nالى :$end";
            log(dateRange.startDate.toString());
          }
        },
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
