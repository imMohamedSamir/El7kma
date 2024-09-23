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
      {String? code, String? name, int? pageNumber, int? pageSize}) async {
    List<Inventoryitemsmodel> items = [];
    final endPoint =
        "Items?name=$name&code=$code&page=${pageNumber ?? 0}&pageSize=${pageSize ?? 10}";
    try {
      final response = await _elhekmaServices.get(endPoint: endPoint);

      for (var item in response['data']) {
        items.add(Inventoryitemsmodel.fromJson(item));
      }
      if (name?.isEmpty ??
          true && (code?.isEmpty ?? true) && (pageNumber == null)) {
        await _saveItems(items: items);
      }
      return right(items);
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

  Future<void> _saveItems({required List<Inventoryitemsmodel> items}) async {
    final box = Hive.box<Inventoryitemsmodel>(kInventoryItems);

    for (var item in items) {
      // Check if an existing item has the same id or code
      int existingItemIndex = box.values.toList().indexWhere((existingItem) =>
          existingItem.id == item.id || existingItem.code == item.code);

      if (existingItemIndex != -1) {
        await box.putAt(existingItemIndex, item);
      } else {
        // If the item doesn't exist, add it
        await box.add(item);
        log("New item added: ${item.code}");
      }
    }

    log("Total items in box: ${box.length}");
  }
}
