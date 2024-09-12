import 'package:bloc/bloc.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Features/AuthView/data/models/SavedUserDetails.dart';
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
      var result =
          await _authRepo.login(userName: userName, password: password);
      result.fold((fail) {
        emit(AuthLoginFailure(errMsg: fail.errMessage));
      }, (result) async {
        await TokenManager.saveUserToken(
            userDetails: SavedUserDetails(
                role: result.roles?.first, token: result.token));

        emit(AuthLoginSuccess());
      });
    } else {
      emit(AuthLoginInitial());
    }
  }
}
