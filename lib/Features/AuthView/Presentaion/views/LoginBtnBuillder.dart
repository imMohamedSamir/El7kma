import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/NavigationMethod.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/AuthView/Presentaion/manager/cubit/auth_login_cubit.dart';
import 'package:el7kma/Features/HomeView/Presentaion/HomeView.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginBtnBuillder extends StatelessWidget {
  const LoginBtnBuillder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthLoginCubit, AuthLoginState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          NavigateToPage.slideFromRightandRemove(
              context: context, page: const HomeView());
        }
      },
      builder: (context, state) {
        if (state is AuthLoginLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.white));
        } else if (state is AuthLoginFailure) {
          String msg = state.errMsg;
          if (state.errMsg == "Invalid credentials") {
            msg = S.of(context).invalidAuth;
          }
          return Column(
            children: [
              Text(
                msg,
                style: AppStyles.styleSemiBold18(context)
                    .copyWith(color: Colors.red),
              ),
              const Gap(16),
              CustomButton(
                text: S.of(context).login,
                txtcolor: Colors.white,
                btncolor: scColor,
                onPressed: () {
                  BlocProvider.of<AuthLoginCubit>(context).login();
                },
              )
            ],
          );
        }
        return CustomButton(
          text: S.of(context).login,
          txtcolor: Colors.white,
          btncolor: scColor,
          onPressed: () {
            BlocProvider.of<AuthLoginCubit>(context).login();
          },
        );
      },
    );
  }
}
