import 'package:el7kma/Core/Utlis/AppAssets.dart';
import 'package:el7kma/Core/Utlis/AppSizes.dart';
import 'package:el7kma/Features/AuthView/Presentaion/views/LoginSec.dart';
import 'package:flutter/material.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 4, child: LoginSec()),
        Expanded(
          flex: 3,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.imagesAuth,
                  matchTextDirection: true,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Image.asset(
                  Assets.imagesAut1,
                  height: AppSizes.getHeight(132, context),
                  width: AppSizes.getWidth(403, context),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
