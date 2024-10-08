import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'import_bills_state.dart';

class ImportBillsCubit extends Cubit<ImportBillsState> {
  ImportBillsCubit(this._importRepo) : super(ImportBillsInitial());
  final ImportBillsRepo _importRepo;
  final DateRangePickerController dateController = DateRangePickerController();
  final TextEditingController supplierController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();

  void get({String? supplierName, String? billNo, int? pageNumber}) async {
    emit(ImportBillsLoading());
    String startDate =
        dateController.selectedRange?.startDate?.toString() ?? "";

    String endDate = (dateController.selectedRange?.endDate ??
            dateController.selectedRange?.startDate)
        .toString();
    if (endDate == "null") {
      endDate = "";
    }
    var result = await _importRepo.getBills(
        supplierName: supplierName ?? supplierController.text,
        billNo: billNoController.text,
        startDate: startDate,
        endDate: endDate,
        pageNumber: pageNumber);
    result.fold((fail) => emit(ImportBillsFailure()),
        (bills) => emit(ImportBillsSuccess(bills: bills)));
  }
}
