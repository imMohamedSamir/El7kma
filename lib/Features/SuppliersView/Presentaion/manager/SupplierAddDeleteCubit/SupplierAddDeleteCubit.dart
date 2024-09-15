import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'supplier_delete_state.dart';

class SupplierAddDeleteCubit extends Cubit<SupplierDeleteState> {
  SupplierAddDeleteCubit(this._supplierRepo) : super(SupplierDeleteInitial());
  final SupplierRepo _supplierRepo;
  final formKey = GlobalKey<FormState>();
  SuppliersModel suppliersModel = SuppliersModel();
  void add() async {
    log(suppliersModel.toJson().toString());
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(SupplierDeleteLoading());
      final result = await _supplierRepo.addSuppliers(supplier: suppliersModel);
      result.fold((fail) => emit(SupplierDeleteFailure()),
          (response) => emit(SupplierAddSuccess()));
    }
  }

  void delete({required String id}) async {
    emit(SupplierDeleteLoading());
    final result = await _supplierRepo.deleteSuppliers(id: id);
    result.fold((fail) => emit(SupplierDeleteFailure()),
        (response) => emit(SupplierDeleteSuccess()));
  }
}
