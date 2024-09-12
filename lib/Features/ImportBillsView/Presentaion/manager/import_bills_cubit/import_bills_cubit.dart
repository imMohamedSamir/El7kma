import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportRepo.dart';
import 'package:meta/meta.dart';

part 'import_bills_state.dart';

class ImportBillsCubit extends Cubit<ImportBillsState> {
  ImportBillsCubit(this._importRepo) : super(ImportBillsInitial());
  final ImportRepo _importRepo;
  void get() async {
    emit(ImportBillsLoading());
    var result = await _importRepo.getBills();
    result.fold((fail) => emit(ImportBillsFailure()),
        (bills) => emit(ImportBillsSuccess(bills: bills)));
  }
}
