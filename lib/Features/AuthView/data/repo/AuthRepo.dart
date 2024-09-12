import 'package:dartz/dartz.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Features/AuthView/data/models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(
      {required String userName, required String password});
}
