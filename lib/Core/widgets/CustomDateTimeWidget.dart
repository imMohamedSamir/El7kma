import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateTimeWidget extends StatelessWidget {
  const CustomDateTimeWidget({
    super.key,
    this.onSubmit,
    this.controller,
  });
  final dynamic Function(Object?)? onSubmit;
  final DateRangePickerController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 550, vertical: 220),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: SfDateRangePicker(
        controller: controller,
        showActionButtons: true,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
        selectionMode: DateRangePickerSelectionMode.range,
        cancelText: S.of(context).Cancel,
        confirmText: S.of(context).OK,
        onSubmit: onSubmit,
        onCancel: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
