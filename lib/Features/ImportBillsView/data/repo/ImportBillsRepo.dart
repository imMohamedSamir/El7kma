import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/ImportBillsView/data/models/ImportBillsModel.dart';

abstract class ImportBillsRepo {
  Future<Either<Failure, List<ImportBillsModel>>> getBills(
      {String? supplierName,
      String? billNo,
      String? startDate,
      String? endDate,
      int? pageNumber});
}
