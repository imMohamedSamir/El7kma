import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/CustomerView/data/models/add_customer_model.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepo.dart';

class CustomerRepoImpl implements CustomerRepo {
  final ElhekmaServices _elhekmaServices;

  CustomerRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, List<CustomerModel>>> getCustomer() async {
    const endPoint = "Customers/GetAll";

    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<CustomerModel> customers = [];
      for (var customer in response) {
        customers.add(CustomerModel.fromJson(customer));
      }
      return right(customers);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addCustomer(
      {required AddCustomerModel custmerModel}) async {
    const endPoint = "Customers/Add";
    try {
      // String token = await TokenManager.getUserToken() ?? "";
      log(custmerModel.toJson().toString());
      final response = await _elhekmaServices.post(
          endPoint: endPoint, body: custmerModel.toJson());
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
  Future<Either<Failure, dynamic>> deleteCustomer({required String id}) async {
    final endPoint = "Customers/$id";
    try {
      // String token = await TokenManager.getUserToken() ?? "";
      final response = await _elhekmaServices.delete(endPoint: endPoint);
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
  Future<Either<Failure, dynamic>> editCustomer(
      {required String id, required AddCustomerModel customer}) async {
    final endPoint = "Customers/$id";
    try {
      // String token = await TokenManager.getUserToken() ?? "";
      final response = await _elhekmaServices.put(
          endPoint: endPoint, body: customer.toJson());
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
}
