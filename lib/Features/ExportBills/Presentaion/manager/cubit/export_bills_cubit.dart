import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'export_bills_state.dart';

class ExportBillsCubit extends Cubit<ExportBillsState> {
  ExportBillsCubit(this._exportRepo) : super(ExportBillsInitial());
  final ExportBillsRepo _exportRepo;
  final TextEditingController userController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();
  final DateRangePickerController dateController = DateRangePickerController();

  void get({
    String? userName,
    String? customerName,
    String? billNo,
  }) async {
    emit(ExportBillsLoading());
    String startDate =
        dateController.selectedRange?.startDate?.toString() ?? "";

    String endDate = (dateController.selectedRange?.endDate ??
            dateController.selectedRange?.startDate)
        .toString();
    if (endDate == "null") {
      endDate = "";
    }
    var result = await _exportRepo.getBills(
      userName: userController.text,
      customerName: customerController.text,
      billNo: billNoController.text,
      startDate: startDate,
      endDate: endDate,
    );
    result.fold((fail) => emit(ExportBillsFailure()),
        (bills) => emit(ExportBillsSuccess(bills: bills)));
  }
}
