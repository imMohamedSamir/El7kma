import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';

abstract class ExportBillsRepo {
  Future<Either<Failure, List<ExportBillModel>>> getBills({
    String? userName,
    String? billNo,
    String? startDate,
    String? endDate,
    String? customerName,
  });
}
