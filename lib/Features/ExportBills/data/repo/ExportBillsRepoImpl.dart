import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';
import 'package:el7kma/Features/ExportBills/data/repo/ExportBillsRepo.dart';

class ExportBillsRepoImpl implements ExportBillsRepo {
  final ElhekmaServices _elhekmaServices;

  ExportBillsRepoImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, List<ExportBillModel>>> getBills({
    String? userName,
    String? customerName,
    String? billNo,
    String? startDate,
    String? endDate,
  }) async {
    // if (startDate == null) {
    //   startDate = DateTime.now().toIso8601String();
    //   endDate = DateTime.now().toIso8601String();
    // }
    String endPoint =
        "UserInvoice/All?employeeName=${userName ?? ""}&customerName=${customerName ?? ""}&startDate=${startDate ?? ""}&endDate=${endDate ?? ""}&receiptNumber=${billNo ?? ""}&pageNumber=1&pageSize=10";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<ExportBillModel> bills = [];
      for (var bill in response['data']) {
        bills.add(ExportBillModel.fromJson(bill));
      }
      return right(bills);
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
