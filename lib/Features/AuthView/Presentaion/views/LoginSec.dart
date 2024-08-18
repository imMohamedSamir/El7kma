import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/NavigationMethod.dart';
import 'package:el7kma/Core/widgets/CustomTextField.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/HomeView/Presentaion/HomeView.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginSec extends StatefulWidget {
  const LoginSec({super.key});

  @override
  State<LoginSec> createState() => _LoginSecState();
}

class _LoginSecState extends State<LoginSec> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 200),
      child: Form(
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
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: S.of(context).login,
              txtcolor: Colors.white,
              btncolor: scColor,
              onPressed: () {
                NavigateToPage.slideFromBottom(
                    context: context, page: const HomeView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
