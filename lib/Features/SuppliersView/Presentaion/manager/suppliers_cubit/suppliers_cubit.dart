import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepo.dart';
import 'package:meta/meta.dart';

part 'suppliers_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  SuppliersCubit(this._supplierRepo) : super(SuppliersInitial());
  final SupplierRepo _supplierRepo;
  SuppliersModel editedSupplier = SuppliersModel();
  void get({String? search, int? pagenumber}) async {
    emit(SuppliersLoading());
    final result = await _supplierRepo.getSuppliers(
        search: search, pagenumber: pagenumber);
    result.fold((fail) => emit(SuppliersFailure()),
        (suppliers) => emit(SuppliersSuccess(suppliers: suppliers)));
  }

  void edit() async {
    emit(SuppliersLoading());

    final result = await _supplierRepo.editSuppliers(supplier: editedSupplier);
    result.fold((fail) {
      emit(SuppliersFailure());
      Future.delayed(const Duration(milliseconds: 650), () {
        get();
      });
    }, (response) async {
      emit(SuppliersEdited());
      Future.delayed(const Duration(milliseconds: 650), () {
        get();
      });
    });
  }
}
