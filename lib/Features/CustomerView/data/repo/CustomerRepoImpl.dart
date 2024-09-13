import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/CustomerView/data/models/CustomerModel.dart';
import 'package:el7kma/Features/CustomerView/data/models/add_customer_model.dart';
import 'package:el7kma/Features/CustomerView/data/repo/CustomerRepo.dart';

class CustomerRepoImpl implements CustomerRepo {
  final ElhekmaServices _elhekmaServices;

  CustomerRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, List<CustomerModel>>> getCustomer() async {
    const endPoint = "Customers";

    try {
      List<CustomerModel> customers = [
        CustomerModel(
          customerName: "mohamed",
          customerPhone: "01127523369",
          total: "500",
          paid: "150",
          rest: "350",
        ),
        CustomerModel(
          customerName: "ahmed",
          customerPhone: "01234567890",
          total: "800",
          paid: "300",
          rest: "500",
        ),
        CustomerModel(
          customerName: "ali",
          customerPhone: "01567890123",
          total: "1200",
          paid: "600",
          rest: "600",
        ),
        CustomerModel(
          customerName: "omar",
          customerPhone: "01987654321",
          total: "1500",
          paid: "900",
          rest: "600",
        ),
        CustomerModel(
          customerName: "amr",
          customerPhone: "01123456789",
          total: "1800",
          paid: "1200",
          rest: "600",
        ),
      ];
      return right(customers);
    } catch (e) {
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> addCustomer(
      {required AddCustomerModel custmerModel}) async {
    const endPoint = "Customers";
    try {
      // String token = await TokenManager.getUserToken() ?? "";
      final response = await _elhekmaServices.post(
          endPoint: endPoint, body: custmerModel.toJson());
      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
