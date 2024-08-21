import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:el7kma/Core/Errors/Failurs.dart';
import 'package:el7kma/Core/Utlis/ApiServices.dart';
import 'package:el7kma/Features/AuthView/data/repo/AuthRepo.dart';

class AuthRepoImpl implements AuthRepo {
  final ElhekmaServices _elhekmaServices;

  AuthRepoImpl(this._elhekmaServices);
  @override
  Future<Either<Failure, dynamic>> login(
      {required String userName, required String password}) async {
    try {
      const endPoint = "";
      final response = await _elhekmaServices.post(
          endPoint: endPoint,
          body: jsonEncode({"username": userName, "password": password}));
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            ServerFailure.fromResponse(e.response?.statusCode, e.response));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
