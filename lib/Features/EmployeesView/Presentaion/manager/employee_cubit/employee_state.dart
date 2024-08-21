part of 'employee_cubit.dart';

@immutable
sealed class EmployeeState {}

final class EmployeeInitial extends EmployeeState {}

final class EmployeeLoading extends EmployeeState {}

final class EmployeeSuccess extends EmployeeState {
  final List<EmployeeModel> employees;

  EmployeeSuccess({required this.employees});
}

final class EmployeeFailure extends EmployeeState {}
