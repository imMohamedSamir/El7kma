import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepo.dart';
import 'package:meta/meta.dart';

part 'export_bills_state.dart';

class ExportBillsCubit extends Cubit<ExportBillsState> {
  ExportBillsCubit(this._exportRepo) : super(ExportBillsInitial());
  final ExportBillsRepo _exportRepo;
  void get({
    String? userName,
    String? billNo,
    String? startDate,
    String? endDate,
    bool? isPaid = false,
  }) async {
    emit(ExportBillsLoading());
    var result = await _exportRepo.getBills(
        userName: userName,
        billNo: billNo,
        startDate: startDate,
        endDate: endDate,
        isPaid: isPaid);
    result.fold((fail) => emit(ExportBillsFailure()),
        (bills) => emit(ExportBillsSuccess(bills: bills)));
  }
}
