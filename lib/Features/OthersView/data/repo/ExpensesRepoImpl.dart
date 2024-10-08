import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';
import 'package:el7kma/Features/OthersView/data/repo/ExpensesRepo.dart';

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

  @override
  Future<Either<Failure, List<ExpensesModel>>> get(
      {String? employeeName}) async {
    final endPoint = "Expense?employeeName=${employeeName ?? ""}";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<ExpensesModel> expenses = [];
      for (var element in response) {
        expenses.add(ExpensesModel.fromJson(element));
      }
      return right(expenses);
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
