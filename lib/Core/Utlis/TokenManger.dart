import 'dart:developer';

import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Features/AuthView/data/models/SavedUserDetails.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

abstract class TokenManager {
  static const _storage = FlutterSecureStorage();
  static Future<void> saveUserToken(
      {required SavedUserDetails userDetails}) async {
    await _storage.write(key: savedToken, value: userDetails.token);
    await _storage.write(key: savedRole, value: userDetails.role);
  }

  static Future<SavedUserDetails> getUserDetails() async {
    SavedUserDetails userDetails = SavedUserDetails();
    String? token = await _storage.read(key: savedToken);

    if (!tokenIsExp(token)) {
      userDetails.userName = JwtDecoder.decode(token!)["sub"];

      userDetails.role = JwtDecoder.decode(token)[kRoleJwt];
      if (userDetails.role == employeeRole) {
        userDetails.role = "موظف";
      } else {
        userDetails.role = "مدير";
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: savedToken);
  }

  static Future<String?> getUserRole() async {
    try {
      return await _storage.read(key: savedRole);
    } on Exception {
      return "";
    }
  }

  static Future<String> getUserName() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["sub"];
    } else {
      return "";
    }
  }

  static Future<String> getUserId() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["uid"];
    } else {
      return "";
    }
  }

  static Future<void> removeToken() async {
    await _storage.delete(key: savedToken);
    await _storage.delete(key: savedRole);
  }

  static bool tokenIsExp(String? userToken) {
    if (userToken == null || userToken.isEmpty) {
      log(userToken == null ? "token is null" : "token is empty");
      return false;
    }

    final isExpired = JwtDecoder.isExpired(userToken);
    if (isExpired) {
      log("expired token");
    }

    return isExpired;
  }
}
