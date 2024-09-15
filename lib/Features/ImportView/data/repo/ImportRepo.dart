import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/ImportView/data/models/add_supplier_invoice_model/add_supplier_invoice_model.dart';

abstract class ImportRepo {
  Future<Either<Failure, dynamic>> add(
      {required AddSupplierInvoiceModel invoice});
}
