import 'dart:developer';

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
  Future<Either<Failure, List<EmployeeModel>>> getEmployee(
      {String? search, int? pagenumber}) async {
    String endPoint = "Employees?page=${pagenumber ?? 0}&pageSize=10";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<EmployeeModel> employees = [];
      for (var employee in response['employees']) {
        employees.add(EmployeeModel.fromJson(employee));
      }
      return right(employees);
    } catch (e) {
      log(e.toString());
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
      log(e.toString());

      if (e is DioException) {
        log(e.response.toString());
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> deleteEmployee({required String id}) async {
    final endPoint = "Employees/$id";
    try {
      final response = await _elhekmaServices.delete(endPoint: endPoint);

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> editEmployee(
      {required AddEmployeeModel employee, required String id}) async {
    try {
      final endPoint = "Employees/$id";

      final response = await _elhekmaServices.put(
          endPoint: endPoint, body: employee.toJson());
      return right(response);
    } catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
