import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';
import 'package:el7kma/Features/ImportBillsView/data/repo/ImportBillsRepo.dart';

class ImportBillsRepoImpl implements ImportBillsRepo {
  final ElhekmaServices _elhekmaServices;

  ImportBillsRepoImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, List<ImportBillsModel>>> getBills(
      {String? supplierName,
      String? billNo,
      String? startDate,
      String? endDate,
      int? pageNumber}) async {
    final endPoint =
        "SupplierInvoices?invoiceNumber=${billNo ?? ""}&supplierName=${supplierName ?? ""}&startDate=${startDate ?? ""}&endDate=${endDate ?? ""}&pageNumber=${pageNumber ?? 1}&pageSize=10";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<ImportBillsModel> bills = [];
      for (var bill in response['invoices']) {
        bills.add(ImportBillsModel.fromJson(bill));
      }
      return right(bills);
    } catch (e) {
      log(e.toString());

      if (e is DioException) {
        log(e.response.toString());
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
