import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';

abstract class EmployeeRepo {
  Future<Either<Failure, List<EmployeeModel>>> getEmployee();
}
