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
      {String? code, String? name}) async {
    try {
      const endPoint = "";
      // final response = await _elhekmaServices.get(endPoint: endPoint);
      List<Inventoryitemsmodel> items = [];
      items.add(Inventoryitemsmodel(
          code: "152",
          product: "ورق",
          qty: 5,
          price: 520,
          isPackage: true,
          packageQty: 200,
          unitPrice: 1));
      items.add(Inventoryitemsmodel(
          code: "153",
          product: "اقلام",
          qty: 4,
          price: 36,
          isPackage: true,
          packageQty: 12,
          unitPrice: 3));
      // for (var item in response) {
      //   items.add(Inventoryitemsmodel.fromJson(item));
      // }
      return right(items);
    } catch (e) {
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
