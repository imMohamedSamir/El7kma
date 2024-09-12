import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/EmployeesView/data/models/add_employee_model.dart';

abstract class EmployeeRepo {
  Future<Either<Failure, List<EmployeeModel>>> getEmployee();
  Future<Either<Failure, dynamic>> addEmployee(
      {required AddEmployeeModel employee});
}
