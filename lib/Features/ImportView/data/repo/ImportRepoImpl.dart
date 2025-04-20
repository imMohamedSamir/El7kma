import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/Supabase_services.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';
import 'package:el7kma/Features/ImportView/data/repo/ImportRepo.dart';

class ImportRepoImpl implements ImportRepo {
  final ElhekmaServices _elhekmaServices;
  final SupabaseServices _supabaseServices;
  ImportRepoImpl(this._elhekmaServices, this._supabaseServices);
  @override
  Future<Either<Failure, dynamic>> add(
      {required AddSupplierInvoiceModel invoice}) async {
    const endPoint = "SupplierInvoices";
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
  Future<Either<Failure, dynamic>> addWithSupa(
      {required AddSupplierInvoiceModel invoice}) async {
    const table = "transactions";
    try {
      // final token = await TokenManager.getUserToken();
      final response = await _supabaseServices.insert(
          table: table, values: invoice.toJsonSupa());
      log(response.toString());
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
