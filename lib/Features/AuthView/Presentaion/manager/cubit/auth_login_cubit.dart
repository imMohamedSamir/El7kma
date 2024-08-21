import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:el7kma/Features/AuthView/data/repo/AuthRepo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(this._authRepo) : super(AuthLoginInitial());
  final AuthRepo _authRepo;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  late String userName, password;
  void login() async {
    emit(AuthLoginLoading());
    if (key.currentState!.validate()) {
      key.currentState!.save();
      log("$userName ||| $password");
      emit(AuthLoginSuccess());
    } else {
      emit(AuthLoginFailure(errMsg: "fail.errMessage"));
    }
    // var result = await _authRepo.login(userName: userName, password: password);
    // result.fold((fail) => emit(AuthLoginFailure(errMsg: fail.errMessage)),
    //     (response) => emit(AuthLoginSuccess()));
  }
}
