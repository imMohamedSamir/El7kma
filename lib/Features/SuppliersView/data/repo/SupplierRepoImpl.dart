import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';
import 'package:el7kma/Features/SuppliersView/data/repo/SupplierRepo.dart';

class SupplierRpoImpl implements SupplierRepo {
  final ElhekmaServices _elhekmaServices;

  SupplierRpoImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, dynamic>> deleteSuppliers({required String id}) async {
    final endPoint = "Suppliers/$id";
    try {
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
  Future<Either<Failure, dynamic>> editSuppliers(
      {required SuppliersModel supplier}) async {
    final endPoint = "Suppliers/${supplier.supplierId}";
    try {
      final response = await _elhekmaServices.put(
          endPoint: endPoint, body: supplier.toJson());

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
  Future<Either<Failure, List<SuppliersModel>>> getSuppliers(
      {String? search, int? pagenumber}) async {
    final endPoint =
        "Suppliers/GetAll?supplierName=${search ?? ""}&pageNumber=${pagenumber ?? 0}&pageSize=10";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<SuppliersModel> suppliers = [];
      for (var supplier in response['suppliers']) {
        suppliers.add(SuppliersModel.fromJson(supplier));
      }
      return right(suppliers);
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
  Future<Either<Failure, dynamic>> addSuppliers(
      {required SuppliersModel supplier}) async {
    const endPoint = "Suppliers/AddNew";
    try {
      final response = await _elhekmaServices.post(
          endPoint: endPoint, body: supplier.toJson());

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
