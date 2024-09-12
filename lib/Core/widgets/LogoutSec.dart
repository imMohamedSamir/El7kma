import 'package:el7kma/Core/Utlis/AppStyles.dart';
import 'package:el7kma/Core/Utlis/Constatnts.dart';
import 'package:el7kma/Core/Utlis/NavigationMethod.dart';
import 'package:el7kma/Core/Utlis/TokenManger.dart';
import 'package:el7kma/Core/widgets/customButton.dart';
import 'package:el7kma/Features/AuthView/Presentaion/AuthView.dart';
import 'package:el7kma/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoutSec extends StatelessWidget {
  const LogoutSec({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _logoutDialog(context);
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.logout_rounded, color: pKcolor, size: 24),
      ),
    );
  }

  void _logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).Logout,
              style: AppStyles.styleSemiBold18(context)),
          content: Text(S.of(context).LogoutMsg,
              style: AppStyles.styleMedium18(context)),
          actions: [
            CustomButton(
              text: S.of(context).OK,
              txtcolor: Colors.white,
              btncolor: Colors.red,
              onPressed: () async {
                await TokenManager.removeToken();
                NavigateToPage.slideFromTopAndRemove(
                    context: context, page: const AuthView());
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: S.of(context).Cancel,
              txtcolor: pKcolor,
              btncolor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
