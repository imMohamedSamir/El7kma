import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/ExpansesView/data/models/expenses_invoice_model.dart';

abstract class ExpensesRepo {
  Future<Either<Failure, dynamic>> add({required ExpensesInvoiceModel invoice});
}
