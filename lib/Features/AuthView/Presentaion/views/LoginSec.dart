import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/ValidationMethods.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Features/AuthView/Presentaion/manager/cubit/auth_login_cubit.dart';
import 'package:el7kma/Features/AuthView/Presentaion/views/LoginBtnBuillder.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginSec extends StatefulWidget {
  const LoginSec({super.key});

  @override
  State<LoginSec> createState() => _LoginSecState();
}

class _LoginSecState extends State<LoginSec> {
  bool secure = true;
  late AuthLoginCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<AuthLoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: Form(
        key: cubit.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.of(context).UserName,
                style: AppStyles.styleMedium18(context)
                    .copyWith(color: Colors.white)),
            const SizedBox(height: 8),
            CustomTextField(
              filled: true,
              hintText: S.of(context).usernNameHint,
              validator: (p0) {
                return Validationmethods.userName(context, value: p0!);
              },
              onSaved: (value) {
                if (value != null) {
                  cubit.userName = value.trim();
                }
              },
            ),
            const SizedBox(height: 24),
            Text(S.of(context).password,
                style: AppStyles.styleMedium18(context)
                    .copyWith(color: Colors.white)),
            const SizedBox(height: 8),
            CustomTextField(
                filled: true,
                hintText: S.of(context).passwordHint,
                maxLines: 1,
                secure: secure,
                suffixIcon: IconButton(
                  icon: Icon(secure == true
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  onPressed: () {
                    secure = !secure;
                    setState(() {});
                  },
                ),
                validator: (p0) {
                  return Validationmethods.passWord(context, value: p0!);
                },
                onSaved: (value) {
                  if (value != null) {
                    cubit.password = value.trim();
                  }
                }),
            const SizedBox(height: 24),
            const LoginBtnBuillder(),
          ],
        ),
      ),
    );
  }
}
