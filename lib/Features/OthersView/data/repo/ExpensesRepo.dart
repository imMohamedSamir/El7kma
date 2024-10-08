import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_invoice_model.dart';
import 'package:el7kma/Features/OthersView/data/models/expenses_model/expenses_model.dart';

abstract class ExpensesRepo {
  Future<Either<Failure, dynamic>> add({required ExpensesInvoiceModel invoice});
  Future<Either<Failure, List<ExpensesModel>>> get({String? employeeName});
}
