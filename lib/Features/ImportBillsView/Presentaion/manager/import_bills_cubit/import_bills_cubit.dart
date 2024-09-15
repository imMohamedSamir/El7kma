import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepo.dart';
import 'package:meta/meta.dart';

part 'import_bills_state.dart';

class ImportBillsCubit extends Cubit<ImportBillsState> {
  ImportBillsCubit(this._importRepo) : super(ImportBillsInitial());
  final ImportBillsRepo _importRepo;
  void get(
      {String? supplierName,
      String? billNo,
      String? startDate,
      String? endDate,
      int? pageNumber}) async {
    emit(ImportBillsLoading());
    var result = await _importRepo.getBills(
        supplierName: supplierName,
        billNo: billNo,
        startDate: startDate,
        endDate: endDate,
        pageNumber: pageNumber);
    result.fold((fail) => emit(ImportBillsFailure()),
        (bills) => emit(ImportBillsSuccess(bills: bills)));
  }
}
