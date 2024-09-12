import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/EmployeesView/data/models/EmployeeModel.dart';
import 'package:el7kma/Features/EmployeesView/data/models/add_employee_model.dart';
import 'package:el7kma/Features/EmployeesView/data/repo/EmployeeRepo.dart';

class EmployeeRepoImpl implements EmployeeRepo {
  final ElhekmaServices _elhekmaServices;

  EmployeeRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, List<EmployeeModel>>> getEmployee() async {
    try {
      List<EmployeeModel> employees = [
        EmployeeModel(
            employeeName: "mohamed",
            employeePhone: "01127523369",
            employeePassword: "11111",
            employeeSalary: "3000"),
        EmployeeModel(
            employeeName: "ali",
            employeePhone: "011545545",
            employeePassword: "235151",
            employeeSalary: "3000")
      ];
      return right(employees);
    } catch (e) {
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addEmployee(
      {required AddEmployeeModel employee}) async {
    try {
      const endPoint = "create";
      final response = await _elhekmaServices.post(
          isLogin: true, endPoint: endPoint, body: employee.toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
