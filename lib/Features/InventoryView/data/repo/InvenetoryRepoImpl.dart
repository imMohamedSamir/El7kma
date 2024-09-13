import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/InventoryView/data/models/InventoryItemsModel.dart';
import 'package:el7kma/Features/InventoryView/data/repo/IneventoryRepo.dart';

class InvenetoryRepoImpl implements IneventoryRepo {
  final ElhekmaServices _elhekmaServices;

  InvenetoryRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, List<Inventoryitemsmodel>>> getItems(
      {String? code, String? name, int? pageNumber}) async {
    try {
      final endPoint =
          "Items?name=$name&code=$code&page=${pageNumber ?? 0}&pageSize=10";
      final response = await _elhekmaServices.get(endPoint: endPoint);
      List<Inventoryitemsmodel> items = [];

      for (var item in response['data']) {
        items.add(Inventoryitemsmodel.fromJson(item));
      }
      return right(items);
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
  Future<Either<Failure, dynamic>> deleteItems({required String id}) async {
    try {
      final endPoint = "Items/$id";
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
  Future<Either<Failure, dynamic>> editItems(
      {required Inventoryitemsmodel item}) async {
    try {
      final endPoint = "Items/${item.id}";
      log(item.toJson().toString());
      final response =
          await _elhekmaServices.put(endPoint: endPoint, body: item.toJson());

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
