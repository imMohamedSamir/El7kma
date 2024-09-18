import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';

abstract class ExportRepo {
  Future<Either<Failure, dynamic>> add({required ExportInvoiceModel invoice});
}
