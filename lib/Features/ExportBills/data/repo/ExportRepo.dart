import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/ExportBills/data/models/ExportBillModel.dart';

abstract class ExportRepo {
  Future<Either<Failure, List<ExportBillModel>>> getBills(
      {String userName, String billNo, String date});
}
