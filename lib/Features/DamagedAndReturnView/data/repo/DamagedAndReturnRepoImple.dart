import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/models/damaged_retrun_model/damaged_return_model.dart';
import 'package:el7kma/Features/DamagedAndReturnView/data/repo/DamagedAndReturnRepo.dart';

class DamagedAndReturnRepoImpl implements DamagedAndReturnRepo {
  final ElhekmaServices _elhekmaServices;

  DamagedAndReturnRepoImpl(this._elhekmaServices);

  @override
  Future<Either<Failure, dynamic>> add(
      {required DamagedRetrunModel invoice}) async {
    const endPoint = "ReturnOrDamaged";
    try {
      final token = await TokenManager.getUserToken();
      final response = await _elhekmaServices.post(
          token: token, endPoint: endPoint, body: invoice.toJson());

      return right(response);
    } catch (e) {
      log(e.toString());
      if (e is DioException) {
        log(e.response.toString());

        return left(ServerFailure(e.response.toString()));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
