import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';

abstract class AuthRepo {
  Future<Either<Failure, dynamic>> login(
      {required String userName, required String password});
}
