import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/SellView/data/models/export_invoice_model.dart';
import 'package:el7kma/Features/SellView/data/repo/ExportRepo.dart';

class ExportRepoImpl implements ExportRepo {
  final ElhekmaServices _elhekmaServices;

  ExportRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, dynamic>> add({required ExportInvoiceModel invoice}) {
    // TODO: implement add
    throw UnimplementedError();
  }
}
