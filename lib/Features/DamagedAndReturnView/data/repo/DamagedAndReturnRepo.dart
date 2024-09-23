import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_model.dart';

abstract class DamagedAndReturnRepo {
  Future<Either<Failure, dynamic>> add({required DamagedRetrunModel invoice});
}
