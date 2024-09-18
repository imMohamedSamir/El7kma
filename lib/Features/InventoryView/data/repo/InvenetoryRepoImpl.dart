import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/InventoryView/data/models/inventory_items_model.dart';
import 'package:el7kma/Features/InventoryView/data/repo/IneventoryRepo.dart';
import 'package:hive/hive.dart';

class InvenetoryRepoImpl implements IneventoryRepo {
  final ElhekmaServices _elhekmaServices;

  InvenetoryRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, List<Inventoryitemsmodel>>> getItems(
      {String? code, String? name, int? pageNumber}) async {
    List<Inventoryitemsmodel> items = [];
    final endPoint =
        "Items?name=$name&code=$code&page=${pageNumber ?? 0}&pageSize=10";
    try {
      items = _getItems();
      if (items.isNotEmpty && name == null && code == null && pageNumber == 0) {
        return right(items);
      } else {
        final response = await _elhekmaServices.get(endPoint: endPoint);

        for (var item in response['data']) {
          items.add(Inventoryitemsmodel.fromJson(item));
        }
        await _saveItems(items: items);

        return right(items);
      }
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

  List<Inventoryitemsmodel> _getItems() {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);
    box.clear();
    return box.values.toList();
  }

  Future<void> _saveItems({required List<Inventoryitemsmodel> items}) async {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);
    for (var item in items) {
      if (!box.values.any((existingItem) =>
          existingItem.id == item.id || existingItem.code == item.code)) {
        await box.add(item);
      }
    }

    log(box.length.toString());
  }
}
