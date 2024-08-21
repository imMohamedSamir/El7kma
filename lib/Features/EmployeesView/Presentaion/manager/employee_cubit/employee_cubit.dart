import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepo.dart';
import 'package:meta/meta.dart';

part 'employee_state.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  EmployeeCubit(this._employeeRepo) : super(EmployeeInitial());
  final EmployeeRepo _employeeRepo;
  void get() async {
    emit(EmployeeLoading());
    var result = await _employeeRepo.getEmployee();
    result.fold((fail) => emit(EmployeeFailure()),
        (employees) => emit(EmployeeSuccess(employees: employees)));
  }
}
