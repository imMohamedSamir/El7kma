import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/EmployeesView/data/models/add_employee_model.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_employee_state.dart';

class AddEmployeeCubit extends Cubit<AddEmployeeState> {
  AddEmployeeCubit(this._employeeRepo) : super(AddEmployeeInitial());
  final EmployeeRepo _employeeRepo;
  final key = GlobalKey<FormState>();
  AddEmployeeModel employeeModel = AddEmployeeModel();
  void add() async {
    employeeModel.dateOfBirth = DateTime.now();
    employeeModel.shiftHours = 8;
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log(employeeModel.toJson().toString());
      emit(AddEmployeeLoading());

      var result = await _employeeRepo.addEmployee(employee: employeeModel);
      result.fold((fail) => emit(AddEmployeeFailure(errMsg: fail.errMessage)),
          (response) => emit(AddEmployeeSuccess()));
    }
  }

  void initial() {
    emit(AddEmployeeInitial());
  }
}
