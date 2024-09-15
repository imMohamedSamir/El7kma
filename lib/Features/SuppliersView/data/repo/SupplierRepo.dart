import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/SuppliersView/data/models/suppliers_model.dart';

abstract class SupplierRepo {
  Future<Either<Failure, List<SuppliersModel>>> getSuppliers(
      {String? search, int? pagenumber});
  Future<Either<Failure, dynamic>> addSuppliers(
      {required SuppliersModel supplier});
  Future<Either<Failure, dynamic>> editSuppliers(
      {required SuppliersModel supplier});
  Future<Either<Failure, dynamic>> deleteSuppliers({required String id});
}
