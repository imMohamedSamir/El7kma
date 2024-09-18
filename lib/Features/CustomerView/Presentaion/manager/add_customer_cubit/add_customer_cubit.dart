import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/CustomerView/data/models/add_customer_model.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_customer_state.dart';

class AddCustomerCubit extends Cubit<AddCustomerState> {
  AddCustomerCubit(this._customerRepo) : super(AddCustomerInitial());
  final CustomerRepo _customerRepo;
  final key = GlobalKey<FormState>();
  AddCustomerModel customerModel = AddCustomerModel();
  void add() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      emit(AddCustomerLoading());
      final result =
          await _customerRepo.addCustomer(custmerModel: customerModel);
      result.fold((fail) => emit(AddCustomerFailure(errMsg: fail.errMessage)),
          (response) => emit(AddCustomerSuccess(id: response.toString())));
    }
  }

  void delete({required String id}) async {
    emit(AddCustomerLoading());
    var result = await _customerRepo.deleteCustomer(id: id);
    result.fold((fail) => emit(AddCustomerFailure(errMsg: fail.errMessage)),
        (customers) {
      emit(AddCustomerDeleted());
    });
  }
}
