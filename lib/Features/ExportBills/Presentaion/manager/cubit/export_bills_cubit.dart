import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportRepo.dart';
import 'package:meta/meta.dart';

part 'export_bills_state.dart';

class ExportBillsCubit extends Cubit<ExportBillsState> {
  ExportBillsCubit(this._exportRepo) : super(ExportBillsInitial());
  final ExportRepo _exportRepo;
  void get() async {
    emit(ExportBillsLoading());
    var result = await _exportRepo.getBills();
    result.fold((fail) => emit(ExportBillsFailure()),
        (bills) => emit(ExportBillsSuccess(bills: bills)));
  }
}
