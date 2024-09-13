import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/EmployeesView/data/models/add_employee_model.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit(this._employeeRepo) : super(EmployeeInitial());
  final EmployeeRepo _employeeRepo;
  void get({String? search, int? pagenumber}) async {
    emit(EmployeeLoading());
    var result =
        await _employeeRepo.getEmployee(search: search, pagenumber: pagenumber);
    result.fold((fail) => emit(EmployeeFailure()), (employees) {
      emit(EmployeeSuccess(employees: employees));
    });
  }

  void edit({required AddEmployeeModel employee, required String id}) async {
    emit(EmployeeLoading());
    employee.email = "";
    log(employee.toJson().toString());
    var result = await _employeeRepo.editEmployee(employee: employee, id: id);
    result.fold((fail) => emit(EmployeeFailure()), (response) async {
      emit(EmployeeEdited());
      get();
    });
  }

  void delete({required String id}) async {
    emit(EmployeeLoading());
    var result = await _employeeRepo.deleteEmployee(id: id);
    result.fold((fail) => emit(EmployeeFailure()), (response) {
      emit(EmployeeDeleted());
      get();
    });
  }
}
