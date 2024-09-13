import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/InventoryView/data/models/InventoryItemsModel.dart';

abstract class IneventoryRepo {
  Future<Either<Failure, List<Inventoryitemsmodel>>> getItems(
      {String code, String name, int pageNumber});
  Future<Either<Failure, dynamic>> editItems(
      {required Inventoryitemsmodel item});
  Future<Either<Failure, dynamic>> deleteItems({required String id});
}
