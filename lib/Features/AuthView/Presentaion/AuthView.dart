import 'package:el7kma/Core/Utlis/service_locator.dart';
import 'package:el7kma/Features/AuthView/Presentaion/manager/cubit/auth_login_cubit.dart';
import 'package:el7kma/Features/AuthView/Presentaion/views/AuthViewBody.dart';
import 'package:el7kma/Features/AuthView/data/repo/AuthRepoImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthLoginCubit(getIt.get<AuthRepoImpl>()),
      child: const Scaffold(
        backgroundColor: Color(0xff022B3A),
        body: AuthViewBody(),
      ),
    );
  }
}
