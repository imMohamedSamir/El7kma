import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/ExpansesView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/ExpansesView/data/repo/ExpensesRepo.dart';

class ExpensesRepoImpl implements ExpensesRepo {
  final ElhekmaServices _elhekmaServices;

  ExpensesRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, dynamic>> add(
      {required ExpensesInvoiceModel invoice}) async {
    const endPoint = "Expense";
    try {
      final token = await TokenManager.getUserToken();
      final response = await _elhekmaServices.post(
          token: token, endPoint: endPoint, body: invoice.toJson());

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
